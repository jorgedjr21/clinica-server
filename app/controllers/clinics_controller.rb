# frozen_string_literal: true

class ClinicsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_clinic, only: %i[update destroy]

  def index
    ActsAsTenant.without_tenant do
      @clinics = Clinic.all
      render jsonapi: @clinics, status: :ok
    end
  end

  def create
    @clinic = Clinic.new(permitted_params)
    if @clinic.save
      render jsonapi: @clinic, status: :created
    else
      render json: @clinic.errors, status: :unprocessable_entity
    end
  end

  def update
    if @clinic.update(permitted_params)
      render jsonapi: @clinic, status: :ok
    else
      render json: @clinic.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @clinic.destroy
      render json: {}, status: :ok
    else
      render json: @clinic.errors, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.require(:clinic).permit(:name, :subdomain, :contact_phone_1, :contact_phone_2)
  end

  def get_clinic
    @clinic = Clinic.find_by(id: params[:id])
    return render jsonapi: @clinic, status: :not_found if @clinic.blank?
  end
end
