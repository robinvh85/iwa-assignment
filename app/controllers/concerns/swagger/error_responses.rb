module Swagger::ErrorResponses
  module UnauthorizedError
    def self.extended base
      base.response 401 do
        key :description, "Unauthorized"
        schema do
          key :"$ref", :ErrorOutput
        end
      end
    end
  end

  module InvalidRecordError
    def self.extended base
      base.response 404 do
        key :description, "Not found"
        schema do
          key :"$ref", :MessageOutput
        end
      end
    end
  end
end
