require "rails_helper"

RSpec.describe "TestResults APIs", :type => :request do
  describe 'POST /api/v1/test_results' do
    let!(:token) { 'token1' }
    let!(:user1) { create(:user, email: 'user1@gmail.com', password: 123456, role: User.roles[:Student], authentication_token: token) }
    let!(:headers) { { token: token } }

    before { user1 }

    subject { post "/api/v1/test_results", headers: headers }

    context 'when params are correct' do
      it "should be successful" do
        subject

        expect(response).to have_http_status(:success)
      end
    end

    context 'when token is not correct' do
      let!(:headers) { { token: 'token2' } }
      it do
        subject

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
