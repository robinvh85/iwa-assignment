module Swagger
  module TestResultsApi
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_path '/api/v1/test_results' do
        operation :post do
          key :description, 'Submit the test_result for a question'
          key :operationId, :submit_test_result
          key :tags, ['TestResults']

          parameter :token

          response 200 do
            key :description, 'Submit test result successfully'
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
