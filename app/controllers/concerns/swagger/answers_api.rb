module Swagger
  module AnswersApi
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_path '/api/v1/answers' do
        operation :post do
          key :description, 'Submit the answer or a question'
          key :operationId, :submit_answer
          key :tags, ['Answers']

          parameter :token
          parameter :answer_body

          response 200 do
            key :description, 'Submit answer successfully'
            schema do
              key :"$ref", :MessageOutput
            end
          end

          extend Swagger::ErrorResponses::UnauthorizedError
          extend Swagger::ErrorResponses::InvalidRecordError
        end
      end
    end
  end
end
