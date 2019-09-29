module Swagger::Parameters
  def self.extended base
    base.parameter :token do
      key :name, "token"
      key :in, :header
      key :description, "Token for authentication"
      key :required, true
      key :type, :string
    end

    base.parameter :authentication_body do
      key :name, "body"
      key :in, :body
      key :description, "Params that need to login"
      schema do
        key :"$ref", :AuthenticationParams
      end
    end

    base.parameter :answer_body do
      key :name, "body"
      key :in, :body
      key :description, "Params that need to submit answer"
      schema do
        key :"$ref", :AnswerParams
      end
    end
  end
end
