class ScrapperJob < ApplicationJob
  queue_as :default

  def perform(web_id)
    service = WebScrapper.new(web_id)
    service.execute
  end
end
