class ApplicationController < ActionController::API

  rescue_from Mongoid::Errors::DocumentNotFound, with: :record_not_found

  def render_errors model
    render json: model.errors, status: :unprocessable_entity
  end

  def record_not_found
    head :not_found
  end

end
