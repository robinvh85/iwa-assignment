require "rails_helper"

RSpec.describe "Answer APIs", :type => :request do
  describe 'POST /api/v1/answers' do
    let!(:token) { 'token1' }
    let!(:user1) { create(:user, email: 'user1@gmail.com', password: 123456, role: User.roles[:Student], authentication_token: token) }
    let!(:params) { {} }
    let!(:headers) { { token: token } }

    before do
      user1

      test = create(:test)
      question = create(:question, id: 10, test_id: test.id)
      option1 = create(:option, id: 1, question_id: question.id)
      option2 = create(:option, id: 2, question_id: question.id)
      option3 = create(:option, id: 3, question_id: question.id)
    end

    subject { post "/api/v1/answers", params: params, headers: headers }

    context 'when token is correct' do
      context 'when params are correct' do
        let!(:params) { {question_id: 10, option_ids: [2, 3]} }

        it "should insert 2 record to test_results" do
          subject
          data = JSON.parse(response.body)

          expect(response).to have_http_status(:success)

          test_results = TestResult.where(question_id: 10)
          expect(test_results.length).to eq(2)
        end
      end

      context 'when params are not correct' do
        let!(:params) { {question_id: 20, option_ids: [2, 3]} }

        it do
          subject
          data = JSON.parse(response.body)

          expect(response).to have_http_status(:not_found)
        end
      end
    end

    context 'when token is not correct' do
      let!(:headers) { { token: 'token2' } }
      let!(:params) { {question_id: 10, option_ids: [2, 3]} }

      it do
        subject

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
