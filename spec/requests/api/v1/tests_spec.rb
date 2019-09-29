require "rails_helper"

RSpec.describe "Tests APIs", :type => :request do
  describe 'GET /api/v1/tests' do
    let!(:token) { 'token1' }
    let!(:user1) { create(:user, email: 'user1@gmail.com', password: 123456, role: User.roles[:Student], authentication_token: token) }
    let!(:headers) { { token: token } }

    before { user1 }

    subject { get "/api/v1/tests", headers: headers }

    context 'when token is correct' do
      before do
        create(:test)
        create(:test)
      end

      it "should return list 2 tests" do
        subject
        data = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(data.length).to eq(2)
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

  describe 'GET /api/v1/tests/{id}' do
    let!(:token) { 'token1' }
    let!(:user1) { create(:user, email: 'user1@gmail.com', password: 123456, role: User.roles[:Student], authentication_token: token) }
    let!(:headers) { { token: token } }

    before do
      user1
      test = create(:test, id: 1, name: 'test 1', description: 'des 1')
      create(:question, test_id: test.id)
      create(:question, test_id: test.id)
    end

    subject { get "/api/v1/tests/1", headers: headers }

    context 'when token is correct' do
      it "should return test with 2 questions" do
        subject
        data = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(data['questions'].length).to eq(2)
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
