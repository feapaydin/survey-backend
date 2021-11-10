# Base class for all controllers
class ApplicationController < ActionController::API
  def render_success(data)
    render json: { success: true, payload: data }, status: :ok
  end

  def render_bad_request(data)
    render json: { success: false, errors: data }, status: :bad_request
  end

  def render_not_found
    render json: { success: false }, status: :not_found
  end
end
