module Swagger
  module TestsApi
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_path '/api/v1/tests' do
        operation :get do
          key :description, 'Get all tests'
          key :operationId, :get_all
          key :tags, ['Tests']

          parameter :token

          response 200 do
            key :description, 'All tests'
            schema type: :array do
              items do
                key :"$ref", :Test
              end
            end
          end

          extend Swagger::ErrorResponses::UnauthorizedError
        end
      end

      swagger_path '/api/v1/tests/{testId}' do
        operation :get do
          key :description, 'Get all tests'
          key :operationId, :get_all
          key :tags, ['Tests']

          parameter :token
          parameter :testId do
            key :name, "testId"
            key :in, :path
            key :description, "Test ID"
            key :type, :integer
            key :required, true
          end

          response 200 do
            key :description, 'Get detail a test'
            schema do
              key :"$ref", :Test
            end
          end

          extend Swagger::ErrorResponses::UnauthorizedError
          extend Swagger::ErrorResponses::InvalidRecordError
        end
      end
    end
  end
end
