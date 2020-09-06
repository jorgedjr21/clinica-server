require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  render_views
  let!(:user) { create(:user) }
  
  before do
    sign_in user
  end

  describe 'GET /clinics' do
    let(:clinics_request) { get :index, params: {}, format: :json }
    let!(:clinic) { create(:clinic) }

    it 'must have http status 200' do
      clinics_request

      expect(response).to have_http_status(200)
    end

    it 'must show all clinics' do
      clinics_request
      data = JSON.parse(response.body)
      expect(data.count).to eq(1)
    end

    it 'must have the clinic name' do
      clinics_request

      expect(response.body).to include(clinic.to_json)
    end
  end

  describe 'POST /clinics' do
    let(:valid_attributes) do
      {
        name: 'clinica 1',
        subdomain: 'clinica 1'.parameterize,
        contact_phone_1: FFaker::PhoneNumberBR.phone_number,
        contact_phone_2: FFaker::PhoneNumberBR.phone_number
      }
    end

    let(:invalid_attributes) do
      {
        name: '',
        subdomain: '',
        contact_phone_1: '',
        contact_phone_2: ''
      }
    end

    context 'with valid attributes' do
      let(:clinics_request) { post :create, params: { clinic: valid_attributes } }

      it 'must create a new clinic' do
        expect { clinics_request }.to change(Clinic, :count).by(1)
      end

      it 'must have the have the correct name' do
        clinics_request
        
        expect(Clinic.last.name).to eq(valid_attributes[:name])
      end

      it 'must have the have the correct subdomain' do
        clinics_request

        expect(Clinic.last.subdomain).to eq(valid_attributes[:subdomain])
      end

      it 'must have the have the correct contact_phone_1' do
        clinics_request

        expect(Clinic.last.contact_phone_1).to eq(valid_attributes[:contact_phone_1])
      end

      it 'must have the have the correct contact_phone_2' do
        clinics_request

        expect(Clinic.last.contact_phone_2).to eq(valid_attributes[:contact_phone_2])
      end
    end

    context 'with invalid attributes' do
      let(:clinics_request) { post :create, params: { clinic: invalid_attributes } }

      it 'must not create a new clinic' do
        expect { clinics_request }.to_not change(Clinic, :count)
      end
    end
  end
end
