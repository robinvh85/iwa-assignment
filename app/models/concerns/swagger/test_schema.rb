# frozen_string_literal: true

module Swagger
  module TestSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_schema :Test do
        property :id do
          key :type, :number
        end

        property :name do
          key :type, :string
        end

        property :description do
          key :type, :string
        end
      end
    end
  end
end
