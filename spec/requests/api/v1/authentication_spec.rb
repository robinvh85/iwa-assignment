require "rails_helper"

RSpec.describe "Authentication APIs", :type => :request do
  describe 'POST /api/v1/authentication/login' do
    context 'when email and password are correct' do
      let!(:role) { User.roles[:Student] }
      let!(:user1) { create(:user, email: 'user1@gmail.com', password: 123456, role: role) }

      before { user1 }
      subject { post "/api/v1/authentication/login", params: { email: 'user1@gmail.com', password: '123456'} }

      context 'when role is student' do
        it "should return user data" do
          subject
          data = JSON.parse(response.body)

          expect(response).to have_http_status(:success)
          expect(data['name']).to eq(user1.name)
          expect(data['email']).to eq(user1.email)
          expect(data['authentication_token']).not_to eq(nil)
        end
      end

      context 'when role is teacher' do
        let!(:role) { User.roles[:Teacher] }

        it do
          subject

          expect(response).to have_http_status(:unauthorized)
        end
      end
    end

    context 'when params are not correct' do
      let!(:password) { 123456 }
      let!(:student1) { create(:user, email: 'student1@gmail.com', password: password, role: User.roles[:Student]) }

      before {
        student1
      }

      subject { post "/api/v1/authentication/login", params: { email: 'student@gmail.com', password: password} }

      context 'when email is not correct' do
        it do
          subject

          expect(response).to have_http_status(:unauthorized)
        end
      end

      context 'when password is not correct' do
        let!(:password) { 12345678 }

        it do
          subject

          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end

  describe 'POST /api/v1/authentication/logout' do
    let!(:student1) { create(:user, email: 'student1@gmail.com', password: 123456, role: User.roles[:Student], authentication_token: token) }

    before { student1 }

    context 'when token is correct' do
      let!(:token) { 'token1' }

      subject { post "/api/v1/authentication/logout", headers: { token: token } }
      it do
        subject
        expect(response).to have_http_status(:success)
      end

      it 'should have authentication_token is nil' do
        subject
        student1 = User.find_by(email: 'student1@gmail.com')
        expect(student1.authentication_token).to eq(nil)
      end
    end

    context 'when token is not correct' do
      let!(:token) { nil }

      subject { post "/api/v1/authentication/logout", headers: { token: 'token 1' } }
      it do
        subject
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when without token' do
      let!(:token) { nil }

      subject { post "/api/v1/authentication/logout", headers: { } }
      it do
        subject
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
