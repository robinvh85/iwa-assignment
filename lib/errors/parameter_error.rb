# frozen_string_literal: true

module Errors
  class ParameterError < StandardError
    attr_reader :message, :errors

    def initialize(errors)
      @message = 'Parameter Error'
      @errors = errors
    end

    def error_messages
      error_msgs = []

      @errors.each do |field, messages|
        # messages.each do |message|
        #   error_msgs << { name: field, message: message }
        # end
        error_msgs << Hash[field, messages[0]]
      end

      error_msgs
    end
  end
end
