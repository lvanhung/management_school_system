module Trackings
  class ExportDataService

    attr_reader :user, :params

    def initialize(user, params)
      @user = user
      @params = params
    end

    # TODO break down the method smaller & handle exception
    def execute
      csv_book = Spreadsheet::Workbook.new
      csv_name = 'tracking_data'
      if @user.teacher?
        sheet = csv_book.create_worksheet
        data = tracking_data_for_specific_class(@user._class.id)
        csv_name = "teacher"
        populate_tracking_datas_to_a_sheet(sheet, tracks: data)
      elsif @user.owner?
        if @user.is_paid? # Paid plan
          @user.school.classes.each do |_class|
            sheet = csv_book.create_worksheet(name: "class #{_class.id.to_s}")
            data = tracking_data_for_specific_class(_class.id)
            csv_name = "paid_owner"
            populate_tracking_datas_to_a_sheet(sheet, tracks: data)
          end
        else #Free Plan
          class_id = @params[:class_id] || @user._class.id
          sheet = csv_book.create_worksheet
          data = tracking_data_for_specific_class(class_id)
          csv_name = "free_owner"
          populate_tracking_datas_to_a_sheet(sheet, tracks: data)
        end
      elsif @user.hq_owner?
        if @user.is_paid? # Paid plan
          @user.schools.each do |school|
            sheet = csv_book.create_worksheet(name: "school #{school.id}")
            data = tracking_data_for_specific_school(school.id)
            csv_name = "paid_hq_owner"
            populate_tracking_datas_to_a_sheet(sheet, tracks: data)
          end
        else # Free plan
          school_id = @params[:school_id] || @user.schools.first.id
          sheet = csv_book.create_worksheet
          data = tracking_data_for_specific_school(school_id)
          csv_name = "free_hq_owner"
          populate_tracking_datas_to_a_sheet(sheet, tracks: data)
        end
      end
      csv_name = csv_name + Time.zone.now.to_s
      csv_book.write("public/csv/#{csv_name}.xls")
      csv_name
    end

    private

    def populate_tracking_datas_to_a_sheet(sheet, tracks:[])
      attributes = %w{child_name time_check_in time_check_out class_name teacher_name }
      sheet.row(0).concat attributes
      row_number = 1
      tracks.each do |track|
        data_row = attributes.map{ |attr| track.send(attr) }
        sheet.insert_row(row_number, data_row)
        row_number += 1
      end
    end

    def tracking_data_for_specific_school(school_id)
      school = School.find(school_id)
      tracking_data = []
      school.classes.each { |_class| tracking_data += _class.trackings }
      tracking_data
    end

    def tracking_data_for_specific_class(class_id)
      SchoolClass.find(class_id).trackings
    end
  end
end
