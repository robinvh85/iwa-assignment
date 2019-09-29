module Api
  class BaseController < ActionController::API
    include Api::Response
    include Api::ExceptionHandler
    include ActionController::Serialization

    before_action :authenticate_request

    def catch_404
      raise ActionController::RoutingError, "/api/#{params[:path]}"
    end

    private

    def authenticate_request
      @user ||= User.find_by(authentication_token: http_token_header)

      if(@user)
        @current_user = @user
      else
        raise Errors::AuthorizationError, 'Invalid token'
      end
    end

    def http_token_header
      return request.headers['token'] if request.headers['token'].present?
      raise Errors::AuthorizationError, 'Missing token'
    end
  end
end
