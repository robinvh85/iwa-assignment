module Swagger
  module ApiDocs
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_root do
        key :swagger, '2.0'
        info do
          key :version, '1.0.0'
          key :title, 'IWA Asignment APIs'
        end
        key :basePath, '/'
        key :consumes, ['application/json']
        key :produces, ['application/json']

        extend Swagger::Parameters
      end

      SWAGGERED_CLASSES = [
        Test,
        User,
        Api::V1::AuthenticationController,
        Api::V1::TestsController,
        Api::V1::AnswersController,
        self
      ].freeze
    end

    def docs_json
      Swagger::Blocks.build_root_json SWAGGERED_CLASSES
    end
  end
end
