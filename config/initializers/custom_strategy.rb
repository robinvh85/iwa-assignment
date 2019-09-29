require 'devise/strategies/database_authenticatable'

module Devise
  module Models
    module Custom
      extend ActiveSupport::Concern
    end
  end

  module Strategies
    class Custom < DatabaseAuthenticatable
      def authenticate!
        resource = User.find_by(email: authentication_hash[:email])

        return fail!('Invalid email or password') if !resource || !resource.Teacher?
        super
      end
    end
  end
end
