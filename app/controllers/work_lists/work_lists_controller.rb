class WorkLists::WorkListsController < ApplicationController
  def new
    if params[:month] == "0"
      flash[:alert] = "Please select MONTH"
      render "work_lists/show"
    else
      render "work_lists/work_list_new"
    end
  end

  def create
    condition = WorkList.find_by(day:         params[:day],
                                 month:       params[:month],
                                 years:        params[:year],
                                 user_id:     params[:user_id])
    if condition.nil?
      WorkList.create(
        day:         params[:day],
        month:       params[:month],
        years:        params[:year],
        user_id:     params[:user_id],
        work_start:  "#{params[:work_start_hour]}:#{params[:work_start_min]}",
        work_stop:   "#{params[:work_stop_hour]}:#{params[:work_stop_min]}",
        break_start: "#{params[:break_start_hour]}:#{params[:break_start_min]}",
        break_stop:  "#{params[:break_stop_hour]}:#{params[:break_stop_min]}",
        hours:       "#{params[:common_hours]}:#{params[:common_hours_min]}",
        comment:     params[:comment]
      )

      flash[:success] = "Added new data to work day #{params[:day]}.#{params[:month]}.#{params[:year]}"
    else
      condition.update!(
        day:         params[:day],
        month:       params[:month],
        years:        params[:year],
        user_id:     params[:user_id],
        work_start:  "#{params[:work_start_hour]}:#{params[:work_start_min]}",
        work_stop:   "#{params[:work_stop_hour]}:#{params[:work_stop_min]}",
        break_start: "#{params[:break_start_hour]}:#{params[:break_start_min]}",
        break_stop:  "#{params[:break_stop_hour]}:#{params[:break_stop_min]}",
        hours:       "#{params[:common_hours]}:#{params[:common_hours_min]}",
        comment:     params[:comment]
      )

      flash[:success] = "Updated new data to work day #{params[:day]}.#{params[:month]}.#{params[:year]}"
    end

    render "work_lists/work_list_new"
  end

  def show
    render "work_lists/show"
  end

  def search
    @work_list = if params[:month] == "0" || params[:month].nil?
                   WorkList.where(user_id: params[:user_id], years: params[:year]).sort_by &:month
                 else
                   WorkList.where(user_id: params[:user_id], month: params[:month], years: params[:year]).sort_by &:month
                 end
    flash[:warning] = "Work lists not found" if @work_list.blank?

    params[:hide] = false

    render "work_lists/show"
  end

  def work_list_pdf
    template(params[:user_id], params[:month], params[:year])
  end

  private
    def template(user_id, month, year)
      user = User.find(params[:user_id])
      days = Time.days_in_month(params[:month].to_i, params[:year].to_i)

      data = [["WORK LIST", "", "", "", "", "", ""]]

      respond_to do |format|
        format.html
        format.pdf do
          Prawn::Document.new(page_size: 'A4', layout: :landscape, rotate: 180) do |pdf|
            data += [[
                       { content: "Month\n#{Date::MONTHNAMES[month.to_i]}", align: :center },
                       "",
                       { content: "Year\n#{year}", align: :center },
                       "",
                       { content: "#{user.first_name} #{user.last_name}", align: :center },
                       "",
                       ""
            ]]

            data += [["", "", "", "", "", "", ""]]

            data += [[
                     { content: "Day", align: :center },
                     { content: "Work start", align: :center },
                     { content: "Work stop", align: :center },
                     { content: "Break start", align: :center },
                     { content: "Break stop", align: :center },
                     { content: "Hours", align: :center },
                     { content: "Comment", align: :center },
             ]]

            days.times do |day|
              day += 1
              wl_line = WorkList.find_by(user_id: user_id, month: month, years: year, day: day)

              data += [[
                 { content: "#{day}", align: :center },
                 { content: wl_line.nil? || wl_line.work_start.nil? || wl_line.work_start == ":" ? "" : wl_line.work_start, align: :center },
                 { content: wl_line.nil? || wl_line.work_stop.nil? || wl_line.work_stop == ":" ? "" : wl_line.work_stop, align: :center },
                 { content: wl_line.nil? || wl_line.break_start.nil? || wl_line.break_start == ":" ? "" : wl_line.break_start, align: :center },
                 { content: wl_line.nil? || wl_line.break_stop.nil? || wl_line.break_stop == ":" ? "" : wl_line.break_stop, align: :center },
                 { content: wl_line.nil? || wl_line.hours.nil? || wl_line.hours == ":" ? "" : wl_line.hours, align: :center },
                 { content: wl_line.nil? || wl_line.comment.nil? || wl_line.comment == ":" ? "" : wl_line.comment, align: :center }
              ]]
            end

            pdf.table(
              data,
              cell_style: { font: "Courier", :size => 9, :style => :normal },
              column_widths: [55, 55, 55, 55, 55, 55, 190],

            ) do |t|
              t.rows(0).align =  :center
              t.rows(0).font_style = :bold
              t.rows(0).border_top_width =  0
              t.rows(0).border_right_width =  0
              t.rows(0).border_left_width = 0

              t.rows(0..-1).column(0..-1).padding_bottom = 4
              t.rows(0..-1).column(0..-1).padding_top = 4
              t.rows(0..-1).column(0..-1).border_widths = 0.3

              #
              if !t.rows(1).empty?
                t.rows(1..-1).columns(0).background_color = "beb9b9"
                t.rows(1..-1).columns(0).size = 10
                t.rows(1).columns(1..-1).background_color = "beb9b9"
                t.rows(2).columns(0).background_color = "ffffff"

                t.rows(2).align =  :center
                t.rows(2).border_top_width =  0
                t.rows(2).border_right_width =  0
                t.rows(2).border_left_width = 0
              end
            end
            data = [[""]]
            pdf.text "\n\n\n\n#{user.first_name} #{user.last_name} _____________"

            send_data pdf.render, filename: "all.pdf", type: "application/pdf", disposition: "inline"
          end
        end
      end
    end
end
