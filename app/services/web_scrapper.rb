class WebScrapper
  attr_accessor :web

  require 'nokogiri'
  require 'open-uri'
  
  def initialize(web_id)
    @web = Web.find(web_id)
  end
  
  def execute
    
    # Fetch and parse HTML document
    doc = Nokogiri::HTML(URI.open(web.url))
    
    # Obtain the Title of the scrapped page
    doc.css('title').each do |title|
      # Get the first 50 characters of the title
      web.name = name_format(title.content)
    end
    
    doc.css('a').each do |link|
      web.weblinks.create(
        # Get the first 50 characters of the body of href
        name: name_format(link.content),
        url: link.attr('href'),
        web_id: web.id
      )
    end
    
    web.total = web.weblinks.count
    web.finished_at = DateTime.now.to_date
    web.save

  rescue
    # This is the case of URI not possible to process with nokogiri
    web.update name: name_format("FAIL: #{web.url}")
    
  end
  
  private 
  def name_format(name)
    return  "#{name[0...47]}..." if name.length >= 50 
    name
  end

end