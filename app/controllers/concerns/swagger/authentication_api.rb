module Swagger
  module AuthenticationApi
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_path '/api/v1/authentication/login' do
        operation :post do
          key :description, 'Login'
          key :operationId, :login
          key :tags, ['Authentication']

          parameter :authentication_body

          response 200 do
            key :description, 'Login successfully'
            schema do
              key :"$ref", :User
            end
          end

          extend Swagger::ErrorResponses::UnauthorizedError
        end
      end

      swagger_path '/api/v1/authentication/logout' do
        operation :post do
          key :description, 'Logout'
          key :operationId, :logout
          key :tags, ['Authentication']

          parameter :token

          response 200 do
            key :description, 'Logout successfully'
            schema do
              key :"$ref", :MessageOutput
            end
          end

          extend Swagger::ErrorResponses::UnauthorizedError
        end
      end
    end
  end
end
