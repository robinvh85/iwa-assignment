module Api
  module V1
    class AnswersController < ::Api::BaseController
      include Swagger::AnswersApi

      def create
        question = Question.find(params[:question_id])
        save_result(question) if(question)

        json_response({message: 'Save result successfully'}, :created)
      end

      private

      def save_result(question)
        TestResult.transaction do
          TestResult.where(question_id: question.id).delete_all()
          option_ids = params[:option_ids]
          option_ids.each do |option_id|
            option = Option.where(question_id: question.id).find(option_id)
            TestResult.create(question_id: question.id, option_id: option.id, user_id: current_user.id)
          end
        end
      end
    end
  end
end
