module Api
  module V1
    class TestsController < ::Api::BaseController
      include Swagger::TestsApi

      def index
        result = Test.all

        json_response(result)
      end

      def show
        test = Test.find(params[:id])
        result = TestSerializer.new(test).as_json
        result[:questions] = ActiveModel::ArraySerializer.new(test.questions)

        json_response(result)
      end
    end
  end
end
