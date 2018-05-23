class UrlsController < ApplicationController

  def index
    urls = Url.order_by(counter: :desc).limit(100)
    render json: urls
  end

end