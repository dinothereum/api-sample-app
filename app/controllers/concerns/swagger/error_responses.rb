module Swagger::ErrorResponses
  module NotFoundError
    def self.extended base
      base.response 404 do
        key :description, "Resource not found"
      end
    end
  end

  module AuthenticationError
    def self.extended base
      base.response 401 do
        key :description, "Not Authorized"
        schema do
          key :'$ref', :AuthenticationError
        end
      end
    end
  end
end