# frozen_string_literal: true

class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :description
end
