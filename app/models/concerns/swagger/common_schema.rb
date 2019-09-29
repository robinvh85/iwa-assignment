# frozen_string_literal: true

module Swagger::CommonSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :AuthenticationParams do
      property :email do
        key :type, :string
      end

      property :password do
        key :type, :string
      end
    end

    swagger_schema :AnswerParams do
      property :question_id do
        key :type, :string
      end

      property :option_ids do
        key :type, :array
        items do
          key :type, :integer
        end
      end
    end

    swagger_schema :ErrorOutput do
      property :message do
        key :type, :string
      end

      property :errors do
        key :type, :string
      end
    end

    swagger_schema :MessageOutput do
      property :message do
        key :type, :string
      end
    end
  end
end
