# frozen_string_literal: true

class TestSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
end
