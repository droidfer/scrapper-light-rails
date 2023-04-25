class WebScrapper
  attr_accessor :web

  require 'nokogiri'
  require 'open-uri'
  
  def initialize(web_id)
    @web = Web.find(web_id)
  end
  
  def execute
    
    # Fetch and parse HTML document
    begin
      doc = Nokogiri::HTML(URI.open(web.url))
    rescue
      # This is the case of URI not possible to process with nokogiri
      web.name = "FAIL: #{web.url}" 
      web.save
      return
    end 
    
    # Obtain the Title of the scrapped page
    doc.css('title').each do |title|
      web.name = title.content
    end
    
    web.save
    web.reload
    
    doc.css('a').each do |link|
      Weblink.create(
        name: link.content,
        url: link.attr('href'),
        web_id: web.id
      )
    end
    
    web.total = web.weblinks.count
    web.finished_at = DateTime.now.to_date
    web.save
    
  end
  
end