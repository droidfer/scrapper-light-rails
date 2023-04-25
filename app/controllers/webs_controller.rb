class WebsController < ApplicationController
  before_action :set_web, only: %i[ show ]
  require 'uri'
  
  def index
    @webs = Web.page params[:page]
  end

  def show
    @weblinks = @web.weblinks.page params[:page]
  end
  
  def create
    set_url = params['url']
    
    unless set_url =~ URI::regexp
      respond_to do |format|
        format.html { redirect_to webs_path, notice: "Invalid URL: #{set_url}" }
      end
      return
    end
    
    @web = Web.new
    @web.url = set_url

    respond_to do |format|
      if @web.save
        
        begin
          service = WebScrapper.new(@web.id)
          service.execute
        rescue
          @web.destroy
          format.html { redirect_to webs_path, notice: "System couldn't find the url." }
        end
        
        format.html { redirect_to webs_path, notice: "Web set in process." }
      else
        format.html { redirect_to webs_path, notice: "Problem in Generation." }
      end
    end
  end

  private
    def set_web
      @web = Web.find(params[:id])
    end
end
