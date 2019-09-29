module Api
  module V1
    class AuthenticationController < ::Api::BaseController
      include Swagger::AuthenticationApi

      skip_before_action :authenticate_request, only: [:login]

      def login
        user = User.find_by(email: params[:email])
        if user&.valid_password?(params[:password]) && user.Student?
          user.authentication_token = Devise.friendly_token
          user.save!
          json_response(user, :created)
        else
          raise ::Errors::AuthorizationError, 'Credentials are not correct'
        end
      end

      def logout
        current_user.authentication_token = nil
        current_user.save!

        json_response({ message: 'Logout successfully' }, :ok)
      end
    end
  end
end
