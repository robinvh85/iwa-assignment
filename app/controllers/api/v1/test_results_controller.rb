module Api
  module V1
    class TestResultsController < ::Api::BaseController
      include Swagger::TestResultsApi

      def create
        json_response({message: 'Save result successfully'}, :created)
      end
    end
  end
end
