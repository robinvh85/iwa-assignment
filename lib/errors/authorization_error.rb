# frozen_string_literal: true

module Errors
  class AuthorizationError < StandardError
    attr_reader :message, :error

    def initialize(error)
      @message = 'Not Authorized'
      @error = error
    end
  end
end
