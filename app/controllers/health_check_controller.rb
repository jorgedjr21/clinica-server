class HealthCheckController < ApplicationController

  def index
    render json: { message: 'It\'s alive!' }, status: :ok
  end
end
