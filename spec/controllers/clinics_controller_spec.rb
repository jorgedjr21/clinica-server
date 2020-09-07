require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:clinic) { create(:clinic) }
  
  before do
    sign_in user
  end

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

  describe 'GET #index' do
    let(:clinics_request) { get :index, params: {}, format: :json }

    it 'must have http status 200' do
      clinics_request

      expect(response).to have_http_status(200)
    end

    it 'must show all clinics' do
      clinics_request
      data = JSON.parse(response.body)['data']
      expect(data.count).to eq(1)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:clinics_request) { post :create, params: { clinic: valid_attributes } }

      it 'must create a new clinic' do
        expect { clinics_request }.to change(Clinic, :count).by(1)
      end

      it 'must have http status 201' do
        clinics_request
        expect(response).to have_http_status(:created)
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

      it 'must have http status 422' do
        clinics_request
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT/PATCH #update" do
    context 'with valid attributes' do
      before do
        patch :update, params: { id: clinic.id, clinic: valid_attributes }
      end

      it 'must update the clinic name' do
        expect(clinic.reload.name).to eq(valid_attributes[:name])
      end

      it 'must update the clinic subdomain' do
        expect(clinic.reload.subdomain).to eq(valid_attributes[:subdomain])
      end

      it 'must update the clinic contact_phone_1' do
        expect(clinic.reload.contact_phone_1).to eq(valid_attributes[:contact_phone_1])
      end

      it 'must update the clinic contact_phone_2' do
        expect(clinic.reload.contact_phone_2).to eq(valid_attributes[:contact_phone_2])
      end
    end

    context 'with invalid attributes' do
      before do
        patch :update, params: { id: clinic.id, clinic: invalid_attributes }
      end

      it 'must not update the clinic name' do
        expect(clinic.reload.name).to eq(clinic.name)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid clinic' do
      it 'must remove the clinic' do
        expect { delete :destroy, params: { id: clinic.id } }.to change(Clinic, :count).by(-1)
      end
    end
  end
end
