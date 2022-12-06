class EggsCollect::CollectListsController < ApplicationController
  def show
    params[:head] = "Eggs collect"

    @eggs = EggCollect.all

    params[:hide] == true

    render "eggs_collect/show", params: params
  end

  def new
    params[:head] = "Eggs collect list, #{params[:month]}.#{params[:year]} - #{params[:house]} "
    puts params.to_json

    if params[:month].empty? || params[:month] == "0"
      flash[:alert] = "Please select MONTH"
      render "eggs_collect/show", params: params
    else
      render "eggs_collect/new", params: params
    end
  end

  def search
    params[:head] = "Eggs collect"

    @eggs = if params[:month].empty? || params[:month] == "0"
                   EggCollect.where(year: params[:year], house: params[:house])
                 else
                   EggCollect.where(year: params[:year], month: params[:month], house: params[:house])
                 end

    flash[:warning] = "Eggs lists not found" if @eggs.blank?

    params[:hide] = false

    render "eggs_collect/show", params: params
  end

  def create
    param = {
      prima: params[:prima].to_i,
      craggs: params[:craggs].to_i,
      big_small: "#{params[:big].to_i}+#{params[:small].to_i}",
      flooreggs: params[:flooreggs].to_i,
      egg_width: params[:egg_width].to_f,
      deads_chick: params[:deads_chicks].to_i,
      deads_hen: params[:deads_hens].to_i,
      comments: params[:comments],
      water_ml_day: params[:water_ml_day].to_i,
      feed_g_day: params[:feed_g_day].to_i,
      hen_width: params[:hen_width].to_i,
      day: params[:day].to_i,
      month: params[:month].to_i,
      year: params[:year].to_i,
      house: params[:house].to_s,
      created_at: DateTime.new(params[:year].to_i, params[:month].to_i, params[:day].to_i),
    }

    if params[:id].to_i == 0
      EggCollect.create!(param)

      flash[:success] = "Create Success"
    else
      ec = EggCollect.find(params[:id])
      ec.update!(param)

      flash[:success] = "Update Success"
    end

    render "eggs_collect/new", day: params[:day], month: params[:month]
  end

  def show_pdf

  end

  def show_excel
    period_id = EggCollect.where(month: params[:month], year: params[:year], house: params[:house]).map(&:period).compact.uniq[0]
    period = CountChick.find_by(id: period_id, house: params[:house])

    days = Time.days_in_month(params[:month].to_i, params[:year].to_i)

    respond_to do |format|
      col_widths = [5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 19]

      format.html
      format.xlsx do
        p = Axlsx::Package.new
        wb = p.workbook

        name_header_user_info = wb.styles.add_style :bg_color => "ECECEC", :b => true, :sz => 8,  :font_name => 'Monaco', :alignment => { :horizontal => :center, :vertical => :center, :wrap_text => true}
        head_info = wb.styles.add_style  :b => true, :sz => 8,  :font_name => 'Monaco', :alignment => { :horizontal => :center, :vertical => :center, :wrap_text => true}
        content_style = wb.styles.add_style  :b => false, :sz => 8,  :font_name => 'Monaco', :alignment => { :horizontal => :center, :vertical => :center, :wrap_text => true}
        content_style_left_text = wb.styles.add_style  :b => true, :sz => 8,  :font_name => 'Monaco', :alignment => { :horizontal => :right, :vertical => :center, :wrap_text => true}

        wb.add_worksheet(name: "Work List",
                         :page_margins => {
                           :left => 0.5,
                           :right => 0.5,
                           :top => 0.1,
                           :bottom => 0.1,
                           :header => 0.0,
                           :footer => 0.0
                         },
                         :paper_size => 9) do |sheet|
          sheet.page_setup.fit_to :paper_size => 9, :fit_to_width => 2

           # header doc
          sheet.add_row ["", "", "", "", "", "", "", "", "", "", "", "", ""], style: head_info

          sheet.merge_cells("A1:B1")
          sheet.merge_cells("C1:D1")
          sheet.merge_cells("F1:H1")
          sheet.merge_cells("K1:M1")
          sheet.rows[0].cells[2].value = "#{params[:year]} - #{params[:year].to_i + 1}"
          sheet.rows[0].cells[5].value = params[:house].to_s
          sheet.rows[0].cells[9].value = "SS 14"
          sheet.rows[0].cells[10].value = "SS 49-52 2021"
          sheet.rows[0].cells[10].style = content_style_left_text

          date = Date.parse("#{params[:year]}-#{params[:month]}-1")
          month_name = date.strftime("%B")

          sheet.add_row ["", "", "", "", "", "", "", "", "", ""], style: head_info
          sheet.merge_cells("A2:C2")
          sheet.merge_cells("J2:M2")
          sheet.rows[1].cells[0].value = "#{month_name} #{params[:year]}"

          sheet.rows[1].cells[9].value = "STARTED #{period.nil? ? "" : period.chicks_start} FEMALE AND #{period.nil? ? "" : period.kukko_start} MALE"
          sheet.rows[1].cells[9].style = content_style_left_text

          sheet.add_row []
          sheet.add_row ["Day","Prime", "Creggs", "Big", "Small", "Flooreggs", "Egg weight", "Deads chiks", "Deads kukko", "Water ml/day", "Feed g/day", "Hen weight", "Comment"]
          13.times { |i| sheet.rows[3].cells[i].style = name_header_user_info }

          prima = 0
          craggs = 0
          big = 0
          small = 0
          flooreggs = 0
          egg_width = 0.0
          deads_chick = 0
          deads_hen = 0
          water = 0
          food = 0
          hen_width = 0
          count_day = 0

          days.times do |day|
            day += 1
            ec = EggCollect.find_by(month: params[:month], year: params[:year], day: day, house: params[:house])
            ec.nil? ? count_day += 0 : count_day += 1


            sheet.add_row [
                                      day,
                                      !ec.nil? && !ec.prima.nil?        ? ec.prima.to_s : "-" ,
                                      !ec.nil? && !ec.craggs.nil?       ? ec.craggs.to_s : "-" ,
                                      !ec.nil? && !ec.big_small.nil?    ? ec.big_small.split("+")[0] : "-",
                                      !ec.nil? && !ec.big_small.nil?    ? ec.big_small.split("+")[1] : "-",
                                      !ec.nil? && !ec.flooreggs.nil?    ? ec.flooreggs.to_s : "-",
                                      !ec.nil? && !ec.egg_width.nil?    ? ec.egg_width : "-",
                                      !ec.nil? && !ec.deads_chick.nil?  ? ec.deads_chick.to_s : "-" ,
                                      !ec.nil? && !ec.deads_hen.nil?    ? ec.deads_hen.to_s : "-" ,
                                      !ec.nil? && !ec.water_ml_day.nil? ? ec.water_ml_day.to_s : "-",
                                      !ec.nil? && !ec.feed_g_day.nil?   ? ec.feed_g_day.to_s : "-",
                                      !ec.nil? && !ec.hen_width.nil?    ? ec.hen_width : "-" ,
                                      !ec.nil? && !ec.comments.nil?     ? ec.comments : "-"
                                    ], style: content_style, :height => 20

            prima += !ec.nil? && !ec.prima.nil? ? ec.prima : 0
            craggs += !ec.nil? && !ec.craggs.nil? ? ec.craggs : 0
            big += !ec.nil? && !ec.big_small.nil? && !ec.big_small.split("+")[0].nil? ? ec.big_small.split("+")[0].to_i : 0
            small += !ec.nil? && !ec.big_small.nil? && !ec.big_small.split("+")[1].to_i ? ec.big_small.split("+")[1].to_i : 0
            flooreggs += !ec.nil? && !ec.flooreggs.nil? ?  ec.flooreggs : 0
            egg_width += !ec.nil? && !ec.egg_width.nil? ? ec.egg_width : 0.0
            deads_chick += !ec.nil? && !ec.deads_chick.nil? ? ec.deads_chick : 0
            deads_hen += !ec.nil? && !ec.deads_hen.nil? ? ec.deads_hen : 0
            water += !ec.nil? && !ec.water_ml_day.nil? ? ec.water_ml_day : 0
            food += !ec.nil? && !ec.feed_g_day.nil? ? ec.feed_g_day : 0
            hen_width += !ec.nil? && !ec.hen_width.nil? ? ec.hen_width : 0
          end

          sheet.add_row []

          sheet.add_row ["Total",
                         prima,
                         craggs,
                         big != 0 ? (big / count_day).round(0) : big,
                         small != 0 ? (small / count_day).round(0) : small,
                         flooreggs,
                         egg_width != 0.0 ? (egg_width / count_day).round(2) : egg_width,
                         deads_chick.to_i,
                         deads_hen.to_i,
                         water != 0 ? (water / count_day).round(0) : water,
                         food != 0 ? (food / count_day).round(0) : food,
                         hen_width
                        ], style: name_header_user_info


          # EggCollect.where(:created_at => DateTime.now.prev_month(12)..DateTime.now)
          sheet.add_row ["", "", "", "", "", "", "", "", "", "", "", ""], style: head_info
          sheet.add_row ["", "", "", "", "", "", "", "", "", "", "", ""], style: head_info
          sheet.merge_cells("G38:I38")
          sheet.merge_cells("J38:L38")

          if !period.nil?
            deads_chick = EggCollect.where(period: period_id, house: params[:house], created_at: ..(DateTime.new(params[:year].to_i, params[:month].to_i, 1))).map(&:deads_chick).inject(0){ |sum, x| sum + x }
            deads_hen = EggCollect.where(period: period_id, house: params[:house], created_at: ..(DateTime.new(params[:year].to_i, params[:month].to_i, 1))).map(&:deads_hen).inject(0){ |sum, x| sum + x }

            begin
              sheet.rows[37].cells[6].value = "Chiks last: #{(period.chicks_start - deads_chick).to_i}"
              sheet.rows[37].cells[9].value = "Kuko last: #{(period.kukko_start - deads_hen).to_i}"
            rescue
              sheet.rows[35].cells[6].value = "Chiks last: #{(period.chicks_start - deads_chick).to_i}"
              sheet.rows[35].cells[9].value = "Kuko last: #{(period.kukko_start - deads_hen).to_i}"
            end
          end

          sheet.column_widths *col_widths
        end

        send_data p.to_stream.read, type: "application/xlsx", filename: "eggs_collect_#{params[:month]}_#{params[:year]}.xlsx"
      end
    end
  end
end
