require 'rails_helper'

RSpec.describe "HealthChecks", type: :request do
  describe 'GET #index' do
    let(:subject) { get '/health_check', params: {} }

    it 'must have status 200' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'must have the succes message' do
      subject
      body = JSON.parse(response.body)

      expect(body['message']).to eq("It's alive!")
    end
  end
end
