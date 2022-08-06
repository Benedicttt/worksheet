class IndexController < ApplicationController
  def index
    redirect_to sessions_new_path if !logged_in?
  end

  def show
    template(params[:id_wss])
  end

  def show_all
    template
  end


  private
  def template(id_wss = nil)
    periods = id_wss.nil? ?  Period.all : Period.where(id: id_wss)
    data = [[""]]

    respond_to do |format|
      format.html
      format.pdf do
        Prawn::Document.new(page_size: 'A4', layout: :landscape, rotate: 180) do |pdf|
          periods.each_with_index do |period|

            period.work_shift_schedules.each_with_index do |w, index|
              user   = User.find(w.user_id)

              data += [[
                         "",
                         { content: "Mon", text_color: "e9e9e9" },
                         { content: "Tue", text_color: "e9e9e9" },
                         { content: "Wed", text_color: "e9e9e9" },
                         { content: "Thu", text_color: "e9e9e9" },
                         { content: "Fri", text_color: "e9e9e9" },
                         { content: "Sat", text_color: "e9e9e9" },
                         { content: "Sun", text_color: "e9e9e9" }
                      ]] if index == 0
              if user.is_available && user.rule.worker
                data += [
                  [
                    { content: "#{user.first_name}",                   align: :center},
                    { content: "#{w.monday_hours}\n#{w.monday}",       align: :center},
                    { content: "#{w.tuesday_hours}\n#{w.tuesday}",     align: :center},
                    { content: "#{w.wednesday_hours}\n#{w.wednesday}", align: :center},
                    { content: "#{w.thursday_hours}\n#{w.thursday}",   align: :center},
                    { content: "#{w.friday_hours}\n#{w.friday}",       align: :center},
                    { content: "#{w.saturday_hours}\n#{w.saturday}",   align: :center},
                    { content: "#{w.sunday_hours}\n#{w.sunday}",       align: :center}
                  ]
                ]
              end

              if index == 0
                pdf.text "\n\n\n\n"
                pdf.text "vk #{period.week_number}   #{period.to} - #{period.from}.#{period.month}.#{period.year}", :size => 12
              end

              puts "TABLE"
              puts data
            end

            pdf.table(
              data,
              cell_style: { size: 8 },
              column_widths: [65, 65, 65, 65, 65, 65, 65, 65]
            ) do |t|
              t.rows(0).align =  :center
              t.rows(0).border_top_width =  0
              t.rows(0).border_right_width =  0
              t.rows(0).border_left_width = 0

              t.columns(0).align =  :center
              t.columns(0).border_top_width =  0
              t.columns(0).border_bottom_width =  0
              t.columns(0).border_left_width = 0

              t.rows(0..-1).column(0..-1).padding_bottom = 10
              t.rows(0..-1).column(0..-1).padding_top = 10

              if !t.rows(1).empty?
                t.rows(2..-1).columns(0).background_color = "09b43a"
                t.rows(1..-1).columns(0).size = 10
                t.rows(1).columns(1..-1).background_color = "716262"

                t.rows(1).align =  :center
                t.rows(1).border_top_width =  0
                t.rows(1).border_right_width =  0
                t.rows(1).border_left_width = 0
              end
            end
            data = [[""]]
          end

          send_data pdf.render, filename: "all.pdf", type: "application/pdf", disposition: "inline"
        end
      end
    end
  end
end