class UrlsController < ApplicationController

  before_action :fetch_or_create_url, only: [:create]

  def index
    urls = Url.order_by(counter: :desc).limit(100)
    render json: {urls: urls}
  end

  def create
    if @url.save
      render json: @url
    else
      render_errors @url
    end
  end

  def show
    url.inc(counter: 1)
    render json: url
  end

  private

  def attributes
    params.require(:url).permit(:full_url, :domain)
  end

  def url
    Url.find_by(short_url: params[:id])
  end

  def fetch_or_create_url
    begin
      @url = Url.find_by(attributes)
    rescue
      @url = Url.new(attributes)
    end
  end

end