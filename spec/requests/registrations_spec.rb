
require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  let(:valid_params) do
    {
      user: {
        name: FFaker::Name.name,
        email: 'user@example.com',
        password: 'password'
      }
    }
  end

  context 'when user is unauthenticated' do
    before { post '/signup', params: valid_params }

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns a new user' do
      user = JSON.parse(response.body)
      expect(user['name']).to eq(valid_params[:user][:name])
      expect(user['email']).to eq(valid_params[:user][:email])
    end
  end

  context 'when user already exists' do
    before do
      create :user, email: valid_params[:user][:email]
      post '/signup', params: valid_params
    end

    it 'returns bad request status' do
      expect(response.status).to eq 400
    end

    it 'returns validation errors' do
      json = JSON.parse(response.body)
      expect(json['errors'].first['title']).to eq('Bad Request')
    end
  end
end
