module Api
  module V1
    class ApiDocsController < ActionController::Base
      include Swagger::ApiDocs
      include Swagger::CommonSchema

      def index
        render json: docs_json, status: :ok
      end
    end
  end
end
