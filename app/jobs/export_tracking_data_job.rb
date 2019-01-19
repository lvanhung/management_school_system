class ExportTrackingDataJob < ActiveJob::Base
  queue_as :default

  #TODO handle exception
  def perform user, params
    ::Trackings::ExportDataService.new(user, params).execute
  end
end
