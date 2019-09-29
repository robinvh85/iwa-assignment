# frozen_string_literal: true

module Swagger
  module UserSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_schema :User do
        property :id do
          key :type, :number
        end

        property :name do
          key :type, :string
        end

        property :email do
          key :type, :string
        end

        property :role do
          key :type, :string
        end

        property :authentication_token do
          key :type, :string
        end
      end
    end
  end
end
