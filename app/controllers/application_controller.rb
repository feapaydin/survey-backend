class ApplicationController < ActionController::API
  def render_success(data)
    render json: { success: true, data: data }, status: :ok
  end

  def render_bad_request(data)
    render json: { success: false, data: data }, status: :bad_request
  end
end
