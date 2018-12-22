module Swagger::UserSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :User do
      key :required, [:name, :email]

      property :name do
        key :type, :string
      end
      
      property :email do
        key :type, :string
      end
    end

    swagger_schema :UserInput do
      allOf do
        schema do
          key :'$ref', :User
        end
        
        schema do
          key :required, [:name]
          property :id do
            key :type, :integer
            key :format, :int64
          end
        end
      end
    end

  end
end