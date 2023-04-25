class WebsController < ApplicationController
  before_action :set_web, only: %i[ show ]
  require 'uri'
  
  def index
    @webs = Web.page params[:page]
    @web = Web.new
  end

  def show
    @weblinks = @web.weblinks.page params[:page]
  end
  
  def create
    @web = Web.new(permitted_data_params)
      if @web.save
        ScrapperJob.perform_later(@web.id)
        redirect_to webs_path, notice: "Web set in process."
      else
        redirect_to webs_path, alert: "This scrapping requirement failed. Please, double check this URL: #{@web.url}" 
      end
  end

  private
    def set_web
      @web = Web.find(params[:id])
    end

  def permitted_data_params
    params.require(:web).permit(:url)
  end
end
