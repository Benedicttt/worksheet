class WorkLists::WorkListsController < ApplicationController
  def new
    params[:head] = "Work List"

    if params[:month] == "0"
      flash[:alert] = "Please select MONTH"
      render "work_lists/show"
    else
      render "work_lists/work_list_new"
    end
  end

  def create
    # begin
      condition = WorkList.find_by(day:         params[:day],
                                   month:       params[:month],
                                   years:       params[:year],
                                   user_id:     params[:user_id])

    work_start_hour  = params[:work_start].split(":")
    work_stop_hour   = params[:work_stop].split(":")
    break_start_hour = params[:break_start].split(":")
    break_stop_hour  = params[:break_stop].split(":")
    common_hours     = params[:common_hours].split(":")

    work_start  = work_start_hour.blank? ? "00:00" : "#{work_start_hour[0]}:#{work_start_hour[1]}"
    work_stop   = work_stop_hour.blank? ? "00:00" : "#{work_stop_hour[0]}:#{work_stop_hour[1]}"
    break_start = break_start_hour.blank? ? "00:00" : "#{break_start_hour[0]}:#{break_start_hour[1]}"
    break_stop  = break_stop_hour.blank? ? "00:00" : "#{break_stop_hour[0]}:#{break_stop_hour[1]}"
    hours       = common_hours.blank? ? "00:00" : "#{common_hours[0]}:#{common_hours[1]}"

    if condition.nil?
        WorkList.create(
          day:         params[:day],
          month:       params[:month],
          years:       params[:year],
          user_id:     params[:user_id],
          comment:     params[:comment],

          work_start:  work_start,
          work_stop:  work_stop,
          break_start: break_start,
          break_stop:  break_stop,


          hours:  hours,

          work_start_minutes:  get_minutes_from_full_time(work_start),
          work_stop_minutes:   get_minutes_from_full_time(work_stop),
          break_start_minutes: get_minutes_from_full_time(break_start),
          break_stop_minutes:  get_minutes_from_full_time(break_stop),
          hours_minutes:       get_minutes_from_full_time(hours)
        )

        flash[:success] = "Added new data to work day #{params[:day]}.#{params[:month]}.#{params[:year]}"
      else
        condition.update!(
          day:         params[:day],
          month:       params[:month],
          years:        params[:year],
          user_id:     params[:user_id],
          comment:     params[:comment],

          work_start:  work_start,
          work_stop:  work_stop,
          break_start: break_start,
          break_stop:  break_stop,
          hours:  hours,

          work_start_minutes:  get_minutes_from_full_time(work_start),
          work_stop_minutes:   get_minutes_from_full_time(work_stop),
          break_start_minutes: get_minutes_from_full_time(break_start),
          break_stop_minutes:  get_minutes_from_full_time(break_stop),
          hours_minutes:       get_minutes_from_full_time(hours)
        )

        flash[:success] = "Updated new data to work day #{params[:day]}.#{params[:month]}.#{params[:year]}"
      end

    # rescue Exception => ss
    #   flash[:alert] = "Internal server error "
    # end

    render "work_lists/work_list_new", day: params[:day]
  end

  def show
    params[:head] = "Work List"

    render "work_lists/show"
  end

  def search
    params[:head] = "Work List"

    @work_list = if params[:month] == "0" || params[:month].nil?
                   WorkList.where(user_id: params[:user_id], years: params[:year]).sort_by &:month
                 else
                   WorkList.where(user_id: params[:user_id], month: params[:month], years: params[:year]).sort_by &:month
                 end
    flash[:warning] = "Work lists not found" if @work_list.blank?

    params[:hide] = false

    render "work_lists/show"
  end

  def work_list_excel
    user = User.find(params[:user_id])
    days = Time.days_in_month(params[:month].to_i, params[:year].to_i)

    respond_to do |format|
      col_widths = [20, 25, 25, 25, 25, 25, 25, 60]

      format.html
      format.xlsx do
        p = Axlsx::Package.new
        wb = p.workbook
        wb.add_worksheet(name: "Work List") do |sheet|
          item_style = wb.styles.add_style :b => false, :sz => 14,  :font_name => 'Monaco', :alignment => { :horizontal => :center, :vertical => :center, :wrap_text => true}
          item_style_2 = wb.styles.add_style :bg_color => "3ea03e", :b => true, :sz => 14,  :font_name => 'Monaco', :alignment => { :horizontal => :center, :vertical => :center, :wrap_text => true}
          item_style_3 = wb.styles.add_style :bg_color => "3ea03e", :b => true, :sz => 14,  :font_name => 'Monaco', :alignment => { :horizontal => :left, :vertical => :center, :wrap_text => true}

          sheet.add_row []
          sheet.add_row ["", "Work List"], :style => item_style
          sheet.add_row ["", "Month \n#{params[:month]}", "Year \n#{params[:year]}", "#{user.first_name} #{user.last_name}"]
          3.times { |i| sheet.rows[2].cells[i + 1].style = item_style_3 }

          sheet.add_row []
          sheet.add_row ["", "Day", "Work start", "Break start", "Break stop", "Work stop", "Hours", "Comment"]
          7.times { |i| sheet.rows[4].cells[i + 1].style = item_style_3 }

          total_hours = 0.0;

          days.times do |day|
            day += 1
            wl_line = WorkList.find_by(user_id: params[:user_id], month: params[:month], years: params[:year], day: day)
            name_day = Time.at((day - 1) * 86400 ).utc.strftime '%A'

            sheet.add_row [] if name_day == "Monday"
            sheet.add_row ["",
                           "(#{day}) #{name_day}",
                            wl_line.nil? || wl_line.work_start.nil? || wl_line.work_start == ":" ? "" : wl_line.work_start,
                            wl_line.nil? || wl_line.break_start.nil? || wl_line.break_start == ":" ? "" : wl_line.break_start,
                            wl_line.nil? || wl_line.break_stop.nil? || wl_line.break_stop == ":" ? "" : wl_line.break_stop,
                            wl_line.nil? || wl_line.work_stop.nil? || wl_line.work_stop == ":" ? "" : wl_line.work_stop,
                            wl_line.nil? || wl_line.hours.nil? || wl_line.hours == ":" ? "" : wl_line.hours,
                            wl_line.nil? || wl_line.comment.nil? || wl_line.comment == ":" ? "" : wl_line.comment

            ], :style => item_style
            total_hours += wl_line.nil? || wl_line.hours.nil? || wl_line.hours == ":" ? 0.0 : wl_line.hours_minutes.to_f
          end

          sheet.add_row []
          sheet.add_row ["", "","","","","","#{get_time_from_minutes(total_hours)[:hours]}h #{get_time_from_minutes(total_hours)[:minutes]}m (#{ '%.2f' % (total_hours/60) })"], :style => item_style

          sheet.rows.each {|row| row.height = 35}
          # sheet.col_style(1,item_style_3)

          35.times { |i| !sheet.rows[i + 5].nil? && !sheet.rows[i + 5].cells[1].nil? ? sheet.rows[i + 5].cells[1].style = item_style_3 : ""}

          start_col = 4
          end_col = 0

          # sheet.merge_cells "A1:A50"

          sheet.column_widths *col_widths
        end

        send_data p.to_stream.read, type: "application/xlsx", filename: "work_list_#{user.first_name}_#{user.last_name}.xlsx"
      end
    end
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
            pdf.font_families.update("Monaco" => {
              :normal => Rails.root.join("app/assets/fonts/Monaco Regular.otf"),
              :italic => Rails.root.join("app/assets/fonts/Monaco Regular.otf"),
              :bold => Rails.root.join("app/assets/fonts/Monaco Regular.otf"),
              :bold_italic => Rails.root.join("app/assets/fonts/Monaco Regular.otf")
            })
            pdf.font "Monaco"

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
                     { content: "Break start", align: :center },
                     { content: "Break stop", align: :center },
                     { content: "Work stop", align: :center },
                     { content: "Hours", align: :center },
                     { content: "Comment", align: :center },
             ]]

            total_hours = 0.0;

            days.times do |day|
              day += 1
              wl_line = WorkList.find_by(user_id: user_id, month: month, years: year, day: day)

              name_day = Time.at((day - 1) * 86400 ).utc.strftime '%A'

              data += [[
                   { content: "(#{day}) #{name_day}", align: :left },
                   { content: wl_line.nil? || wl_line.work_start.nil? || wl_line.work_start == ":" ? "" : wl_line.work_start, align: :center },
                   { content: wl_line.nil? || wl_line.break_start.nil? || wl_line.break_start == ":" ? "" : wl_line.break_start, align: :center },
                   { content: wl_line.nil? || wl_line.break_stop.nil? || wl_line.break_stop == ":" ? "" : wl_line.break_stop, align: :center },
                   { content: wl_line.nil? || wl_line.work_stop.nil? || wl_line.work_stop == ":" ? "" : wl_line.work_stop, align: :center },
                   { content: wl_line.nil? || wl_line.hours.nil? || wl_line.hours == ":" ? "" : wl_line.hours, align: :center },
                   { content: wl_line.nil? || wl_line.comment.nil? || wl_line.comment == ":" ? "" : wl_line.comment, align: :center }

              ]]

              total_hours += wl_line.nil? || wl_line.hours.nil? || wl_line.hours == ":" ? 0.0 : wl_line.hours_minutes.to_f ;
            end

            data += [[
                       { content: "", align: :center },
                       { content: "", align: :center },
                       { content: "", align: :center },
                       { content: "", align: :center },
                       { content: "Total hours", align: :center },
                       { content: "#{get_time_from_minutes(total_hours)[:hours]}h #{get_time_from_minutes(total_hours)[:minutes]}m (#{ '%.2f' % (total_hours/60) })", align: :center },
                       { content: "", align: :center },
                     ]]

            pdf.table(
              data,
              cell_style: { font: "Monaco", :size => 9, :style => :normal },
              column_widths: [85, 55, 55, 55, 55, 55, 140],

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
                t.rows(1..-1).columns(0).size = 9
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
