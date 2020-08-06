require 'rails_helper'

RSpec.describe 'Authentication', type: :request do

  describe 'POST /login' do
    let(:user) { create(:user) }
    let(:valid_params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    context 'with valid params' do
      before do
        post '/login', params: valid_params
      end

      it 'must returns 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns JWT token in authorization header' do
        expect(response.headers['Authorization']).to be_present
      end

      it 'returns valid JWT token' do
        token_from_request = response.headers['Authorization'].split(' ').last
        decoded_token      = JWT.decode(token_from_request, ENV['DEVISE_JWT_SECRET_KEY'], true)
        expect(decoded_token.first['sub']).to be_present
      end
    end

    context 'when login params are incorrect' do
      before { post '/login' }
      it 'returns unathorized status' do
        expect(response.status).to eq 401
      end
    end
  end

  describe 'DELETE /logout' do
  
    it 'returns 204, no content' do
      delete '/logout'
      expect(response).to have_http_status(204)
    end
  end
end
