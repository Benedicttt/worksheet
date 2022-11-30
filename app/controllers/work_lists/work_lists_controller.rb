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
    washing_time     = params[:washing_time].split(":")
    common_hours     = params[:common_hours].split(":")

    work_start   = work_start_hour.blank? ? "00:00" : "#{work_start_hour[0]}:#{work_start_hour[1]}"
    work_stop    = work_stop_hour.blank? ? "00:00" : "#{work_stop_hour[0]}:#{work_stop_hour[1]}"
    break_start  = break_start_hour.blank? ? "00:00" : "#{break_start_hour[0]}:#{break_start_hour[1]}"
    break_stop   = break_stop_hour.blank? ? "00:00" : "#{break_stop_hour[0]}:#{break_stop_hour[1]}"
    washing_time = washing_time.blank? ? "00:00" : "#{washing_time[0]}:#{washing_time[1]}"
    hours        = common_hours.blank? ? "00:00" : "#{common_hours[0]}:#{common_hours[1]}"

    if condition.nil?
        WorkList.create(
          day:         params[:day],
          month:       params[:month],
          years:       params[:year],
          user_id:     params[:user_id],
          comment:     params[:comment],
          free_day:    params[:free_day],
          vacation:    params[:vacation],

          work_start:  work_start,
          work_stop:  work_stop,
          break_start: break_start,
          break_stop:  break_stop,
          washing_time: washing_time,


          hours:  hours,

          work_start_minutes:   get_minutes_from_full_time(work_start),
          work_stop_minutes:    get_minutes_from_full_time(work_stop),
          break_start_minutes:  get_minutes_from_full_time(break_start),
          break_stop_minutes:   get_minutes_from_full_time(break_stop),
          washing_time_minutes: get_minutes_from_full_time(washing_time),
          hours_minutes:        get_minutes_from_full_time(hours)
        )

        flash[:success] = "Added new data to work day #{params[:day]}.#{params[:month]}.#{params[:year]}"
      else
        condition.update!(
          day:         params[:day],
          month:       params[:month],
          years:        params[:year],
          user_id:     params[:user_id],
          comment:     params[:comment],
          free_day:    params[:free_day],
          vacation:    params[:vacation],

          work_start:  work_start,
          work_stop:  work_stop,
          break_start: break_start,
          break_stop:  break_stop,
          washing_time: washing_time,
          hours:  hours,

          work_start_minutes:   get_minutes_from_full_time(work_start),
          work_stop_minutes:    get_minutes_from_full_time(work_stop),
          break_start_minutes:  get_minutes_from_full_time(break_start),
          break_stop_minutes:   get_minutes_from_full_time(break_stop),
          washing_time_minutes: get_minutes_from_full_time(washing_time),
          hours_minutes:        get_minutes_from_full_time(hours)
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
    @work_list = if params[:month] == "0"
                   WorkList.where(user_id: params[:user_id], years: params[:year])
                 else
                   WorkList.where(user_id: params[:user_id], month: params[:month], years: params[:year])
                 end

    flash[:warning] = "Work lists not found" if @work_list.blank?

    params[:hide] = false

    render "work_lists/show"
  end

  def work_list_excel
    user = User.find(params[:user_id])
    days = Time.days_in_month(params[:month].to_i, params[:year].to_i)

    respond_to do |format|
      col_widths = [5, 3, 6, 6, 6, 6, 6, 7, 6, 38]

      format.html
      format.xlsx do
        p = Axlsx::Package.new
        wb = p.workbook


        wb.add_worksheet(
            name: "Work List",
            :page_margins => {
              :left => 0.5,
              :right =>  0.5,
              :top => 0.1,
              :bottom => 0.1,
              :header => 0.0,
              :footer => 0.0
            },
            :paper_size => 9
        ) do |sheet|
          sheet.page_setup.fit_to :paper_size => 9, :fit_to_width => 2

          #  BorderPr.style must be one of [:none, :thin, :medium, :dashed, :dotted, :thick, :double, :hair, :mediumDashed, :dashDot, :mediumDashDot, :dashDotDot, :mediumDashDotDot, :slantDashDot].

          item_style = wb.styles.add_style :b => false, :sz => 8,  :font_name => 'Monaco', :alignment => { :horizontal => :center, :vertical => :center, alignment: { horizontal: :center, :vertical => :center, :wrap_text => true } }
          style_for_footer = wb.styles.add_style :bg_color => "ECECEC", :b => false, :sz => 7,  :font_name => 'Monaco', :alignment => { :horizontal => :center, :vertical => :center, :wrap_text => true}
          item_style_4 = wb.styles.add_style :border => { :style => :dotted, :color => "F000000", :edges => [:top, :bottom] }, :bg_color => "ffffff", :b => false, :sz => 8,  :font_name => 'Monaco', :alignment => { :horizontal => :center, :vertical => :center, :wrap_text => true}
          name_header_user_info = wb.styles.add_style :bg_color => "ECECEC", :b => true, :sz => 8,  :font_name => 'Monaco', :alignment => { :horizontal => :center, :vertical => :center, :wrap_text => true}


          header = sheet.add_row ["", "Month \n#{params[:month]}", "", "Year \n#{params[:year]}", "", "#{user.first_name} #{user.last_name}"], :height => 24
          5.times { |i| sheet.rows[0].cells[i + 1].style = name_header_user_info }
          sheet.merge_cells('B%i:C%i' % [sheet.rows.index(header) + 1, sheet.rows.index(header) + 1])
          sheet.merge_cells('D%i:E%i' % [sheet.rows.index(header) + 1, sheet.rows.index(header) + 1])
          sheet.merge_cells('F%i:G%i' % [sheet.rows.index(header) + 1, sheet.rows.index(header) + 1])

          sheet.add_row []
          sheet.add_row ["Week","", "Day", "Work start", "Break start", "Break stop", "Work stop", "Washing", "Hours", "Comment"]
          10.times { |i| sheet.rows[2].cells[i].style = name_header_user_info }

           # variable
          total_hours = 0.0
          total_hours_without_lunch = 0.0
          total_hours_washing = 0.0

          number_week_day = {}

          # days

          days.times do |day|
            day += 1
            date = Date.parse("#{params[:year]}-#{params[:month]}-#{day}")
            week = date.strftime("%W").to_i

            number_week_day.merge!(day => {week: week, wday: date.wday})
          end


          days.times do |day|
            day += 1
            wl_line = WorkList.find_by(user_id: params[:user_id], month: params[:month], years: params[:year], day: day)
            name_day = DateTime.new(params[:year].to_i, params[:month].to_i, day).utc.strftime '%A'

            #
            if name_day == "Monday"
              monday = sheet.add_row []
              sheet.merge_cells "A#{sheet.rows.index(monday) + 1}:J#{sheet.rows.index(monday) + 1}"
            end

            content = sheet.add_row [
                            !number_week_day[day + 1].nil? && (number_week_day[day][:week] == number_week_day[day + 1][:week]) ? "" : number_week_day[day][:week],
                            day,
                            name_day[0..2],
                            wl_line.nil? || wl_line.work_start.nil? || wl_line.work_start == ":" ? "" : wl_line.work_start,
                            wl_line.nil? || wl_line.break_start.nil? || wl_line.break_start == ":" ? "" : (wl_line.break_start = "00:00" ? "-" : wl_line.break_start),
                            wl_line.nil? || wl_line.break_stop.nil? || wl_line.break_stop == ":" ? "" : (wl_line.break_stop = "00:00" ? "-" : wl_line.break_stop),
                            wl_line.nil? || wl_line.work_stop.nil? || wl_line.work_stop == ":" ? "" : wl_line.work_stop,
                            wl_line.nil? || wl_line.washing_time.nil? || wl_line.washing_time == ":" ? "" : (wl_line.washing_time = "00:00" ? "-" : wl_line.washing_time),
                            wl_line.nil? || wl_line.hours.nil? || wl_line.hours == ":" ? "" : wl_line.hours,
                            wl_line.nil? || wl_line.comment.nil? || wl_line.comment == ":" ? "" : wl_line.comment


            ], :style => item_style, :height => (!wl_line.nil? && !wl_line.comment.nil?) ? wl_line.comment.size > 48 ? 48 : 18 : 18

            number_week_day[day].merge!(row: sheet.rows.index(content) + 1)

            total_hours += wl_line.nil? || wl_line.hours.nil? || wl_line.hours == ":" || wl_line.hours == 0.0 ? 0.0 : wl_line.hours_minutes.to_f
            total_hours_washing += wl_line.nil? || wl_line.washing_time.nil? || wl_line.washing_time == ":" ? 0.0 : wl_line.washing_time_minutes.to_f

            if !wl_line.nil?
              if wl_line.vacation
                total_hours_without_lunch +=  wl_line.hours_minutes.to_f - 30.0
              elsif  wl_line.hours_minutes <= 389.0
                total_hours_without_lunch += wl_line.hours_minutes.to_f
              else
                total_hours_without_lunch += wl_line.hours_minutes.nil? || wl_line.hours_minutes.eql?(0.0) ? 0.0 : wl_line.hours_minutes.to_f - 30.0
              end
            end
          end

          //
          week_new = { }

          number_week_day.each do |day|
            week_new.merge! day[1][:week] => []
          end

          number_week_day.each do |day|
            week_new[day[1][:week]] << [day[0], day[1][:row]]
          end

          week_new.each do |key, value|
            sheet.rows[value[0][1] - 1].cells[0].value = key.to_s + " "

            ((value[0][1] - 1)..(value[-1][1] - 1)).to_a.map do |m|
              sheet.rows[m].style = item_style_4
            end

            sheet.merge_cells "A#{value[0][1]}:A#{value[-1][1]}"

          end

          # puts number_week_day
          # puts week_new
          //
          # sheet.merge_cells "A#{s}:A#{n}" if number_week_day[day][:wday] == 6

          sheet.add_row []
          result_hours = sheet.add_row [
                         "All washing time #{get_time_from_minutes(total_hours_washing)[:hours]}h #{get_time_from_minutes(total_hours_washing)[:minutes]}m (#{ '%.2f' % (total_hours_washing/60) })", "",
                         "All the time without lunch #{get_time_from_minutes(total_hours_without_lunch)[:hours]}h #{get_time_from_minutes(total_hours_without_lunch)[:minutes]}m (#{ '%.2f' % (total_hours_without_lunch/60) })", "",
                         "All the time with lunch #{get_time_from_minutes(total_hours)[:hours]}h #{get_time_from_minutes(total_hours)[:minutes]}m (#{ '%.2f' % (total_hours/60) })", ""
                         ],
                        :style => style_for_footer
          sheet.add_row []


          sheet.merge_cells('A%i:B%i' % [sheet.rows.index(result_hours) + 1, sheet.rows.index(result_hours) + 2])
          sheet.merge_cells('C%i:D%i' % [sheet.rows.index(result_hours) + 1, sheet.rows.index(result_hours) + 2])
          sheet.merge_cells('E%i:F%i' % [sheet.rows.index(result_hours) + 1, sheet.rows.index(result_hours) + 2])
          
          # sheet.merge_cells "A#{value[0][1]}:A#{value[-1][1]}"

          # sheet.rows.each {|row| row.height = 10}
          36.times { |i| !sheet.rows[i + 3].nil? && !sheet.rows[i + 3].cells[1].nil? ? sheet.rows[i + 3].cells[1].style = name_header_user_info : ""}

          # 10.times { |i| sheet.rows[4].style = item_style_2 }
          # sheet.merge_cells "A6:A9"
          # sheet.merge_cells "A11:A17"

          sheet.column_widths *col_widths
        end

        send_data p.to_stream.read, type: "application/xlsx", filename: "#{user.first_name}_#{user.last_name}_#{params[:month]}_#{params[:year]}.xlsx"
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
                     { content: "Washing", align: :center },
                     { content: "Hours", align: :center },
                     { content: "Comment", align: :center },
             ]]

            total_hours = 0.0
            total_hours_without_lunch = 0.0
            total_hours_washing = 0.0

            days.times do |day|
              day += 1
              wl_line = WorkList.find_by(user_id: user_id, month: month, years: year, day: day)

              name_day = DateTime.new(params[:year].to_i, params[:month].to_i, day).utc.strftime '%A'

              data += [[
                   { content: "(#{day}) #{name_day}", align: :left },
                   { content: wl_line.nil? || wl_line.work_start.nil? || wl_line.work_start == ":" ? "" : wl_line.work_start, align: :center },
                   { content: wl_line.nil? || wl_line.break_start.nil? || wl_line.break_start == ":" ? "" : wl_line.break_start, align: :center },
                   { content: wl_line.nil? || wl_line.break_stop.nil? || wl_line.break_stop == ":" ? "" : wl_line.break_stop, align: :center },
                   { content: wl_line.nil? || wl_line.work_stop.nil? || wl_line.work_stop == ":" ? "" : wl_line.work_stop, align: :center },
                   { content: wl_line.nil? || wl_line.washing_time.nil? || wl_line.washing_time == ":" ? "" : wl_line.washing_time, align: :center },
                   { content: wl_line.nil? || wl_line.hours.nil? || wl_line.hours == ":" ? "" : wl_line.hours, align: :center },
                   { content: wl_line.nil? || wl_line.comment.nil? || wl_line.comment == ":" ? "" : wl_line.comment, align: :center }

              ]]

              total_hours += wl_line.nil? || wl_line.hours.nil? || wl_line.hours == ":" ? 0.0 : wl_line.hours_minutes.to_f
              total_hours_washing += wl_line.nil? || wl_line.washing_time.nil? || wl_line.washing_time == ":" ? 0.0 : wl_line.washing_time_minutes.to_f

              if !wl_line.nil?
                if wl_line.vacation
                  total_hours_without_lunch +=  wl_line.hours_minutes.to_f - 30.0
                elsif  wl_line.hours_minutes <= 389.0
                  total_hours_without_lunch += wl_line.hours_minutes.to_f
                else
                  total_hours_without_lunch += wl_line.hours_minutes.nil? || wl_line.hours_minutes.eql?(0.0) ? 0.0 : wl_line.hours_minutes.to_f - 30.0
                end
              end
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

            data += [[
                       { content: "", align: :center },
                       { content: "", align: :center },
                       { content: "", align: :center },
                       { content: "", align: :center },
                       { content: "Total hours without lunch", align: :center },
                       { content: "#{get_time_from_minutes(total_hours_without_lunch)[:hours]}h #{get_time_from_minutes(total_hours_without_lunch)[:minutes]}m (#{ '%.2f' % (total_hours_without_lunch/60) })", align: :center },
                       { content: "", align: :center },
                     ]]

            data += [[
                       { content: "", align: :center },
                       { content: "", align: :center },
                       { content: "", align: :center },
                       { content: "", align: :center },
                       { content: "Total washing hours", align: :center },
                       { content: "#{get_time_from_minutes(total_hours_washing)[:hours]}h #{get_time_from_minutes(total_hours_washing)[:minutes]}m (#{ '%.2f' % (total_hours_washing/60) })", align: :center },
                       { content: "", align: :center },
                     ]]

            pdf.table(
              data,
              cell_style: { font: "Monaco", :size => 8, :style => :normal },
              column_widths: [85, 45, 45, 45, 50, 47, 45, 140],

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
