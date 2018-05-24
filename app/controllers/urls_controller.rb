class UrlsController < ApplicationController

  def index
    urls = Url.order_by(counter: :desc).limit(100)
    render json: {urls: urls}
  end

  def create
    url = Url.new(attributes)

    if url.save
      render json: url
    else
      render_errors url
    end
  end

  def show
    render json: url
  end

  private

  def attributes
    params.require(:url).permit(:full_url)
  end

  def url
    Url.find_by(short_url: params[:id])
  end

end