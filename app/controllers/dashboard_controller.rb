# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { message: 'ok' }, status: :ok
  end
end
