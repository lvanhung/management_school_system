class TrackingController < ApplicationController

  # TODO For large data we can create a job to perform in background & the csv file should be upload to storage such as S3
  #   Then send the link via email and then user can be downloaded it later.
  def export_data
    if export_feature_enable?
      csv_file = ::Trackings::ExportDataService.new(current_user, params_for_export).execute
      # ExportTrackingDataJob.perform_later(current_user, params_for_export) handle via job
      send_file "public/csv/#{csv_file}.xls"
    else
      Logger.log("Sorry, we haven't supported the feature yet")
    end
  end

  private

  def current_user
    User.find_by_id(params_for_export[:user_id]) || User.first
  end

  def params_for_export
    params.except(:tracking).permit(:class_id, :school_id, :user_id)
  end

  def export_feature_enable?
    feature = Feature.find_by_name('export_csv_tracking_data')
    feature.enable?
  end
end
