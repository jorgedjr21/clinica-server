require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let(:user) { create(:user) }
  describe 'GET /dashboard/' do
    let(:dashboard_index_subject) { get :index, params: {} }
    context 'user logged in' do
      before do
        sign_in user
      end

      it 'must have http status 200' do
        dashboard_index_subject

        expect(response).to have_http_status(200)
      end

      it 'must have access to page content' do
        dashboard_index_subject
        body = JSON.parse(response.body)

        expect(body['message']).to eq('ok')
      end
    end

    context 'not logged in user' do
      it 'must have http status 401' do
        dashboard_index_subject

        expect(response).to have_http_status(401)
      end

      it 'must not have access to page content' do
        dashboard_index_subject

        expect(response.body).to eq(I18n.t('devise.failure.unauthenticated'))
      end
    end
  end
end
