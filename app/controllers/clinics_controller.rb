# frozen_string_literal: true

class ClinicsController < ApplicationController
  before_action :authenticate_user!

  def index
    ActsAsTenant.without_tenant do
      @clinics = Clinic.all
      render 'clinics/index.json', status: :ok
    end
  end

  def create
    @clinic = Clinic.new(permitted_params)
    if @clinic.save
      render 'clinics/create.json', status: :created
    else
      render 'clinics/create.json', status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.require(:clinic).permit(:name, :subdomain, :contact_phone_1, :contact_phone_2)
  end
end
