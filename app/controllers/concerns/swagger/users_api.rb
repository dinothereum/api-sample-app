module  Swagger::UsersApi 
  extend  ActiveSupport::Concern 
  include  Swagger::Blocks

  included do
    include Swagger::ErrorSchema

    swagger_path "/users/{userId}" do 
      operation :get do
        key :summary, "Find User by ID"
        key :description, "Return a Single User"
        key :operationId, :findUserById
        
        # Include parameters common has been defined
        extend Swagger::Parameters::Users 

        response 200 do
          key :description, "Successful Operation"
          schema do 
            key :'$ref', :User
          end
        end

        # Captures the error response which is separately defined 
        extend Swagger::ErrorResponses::NotFoundError 
        extend Swagger::ErrorResponses::AuthenticationError 
      end 
    end

    swagger_path  "/users"  do
      operation :get do
        key :summary, "Get All Users"
        key :description, "Return all Users"
        key :operationId, :findUsers

        parameter do
          key :name, :limit
          key :in, :query
          key :description, 'maximum number of results to return'
          key :required, false
          key :type, :integer
          key :format, :int32
        end

        response 200 do
          key :description, 'Users Response'
          schema do
            key :type, :array
            items do
              key :'$ref', :User
            end
          end
        end

        extend Swagger::ErrorResponses::NotFoundError 
        extend Swagger::ErrorResponses::AuthenticationError 
      end
    end

    swagger_path "/user" do
      operation :post do
        key :summary, "Create a New User"
        key :description, "This can only be done by the logged in user."
        key :operationId, :createNewUser

        parameter do
          key :name, :user
          key :in, :body
          key :description, "Created user object"
          key :required, true
          schema do
            key :'$ref', :UserInput
          end
        end

        response 200 do
          key :description, "User Response"
          schema do
            key :'$ref', :User
          end
        end
      end
    end

    swagger_path "/user" do
      operation :put do
        key :summary, "Update an existing user"
        key :description, "User object that needs to be added to the system"
        key :operationId, :updateUser

        extend Swagger::Parameters::Users
        parameter do
          key :name, :user
          key :in, :body
          key :description, "Update user object"
          key :required, true
          schema do
            key :'$ref', :UserInput
          end
        end

        response 200 do
          key :description, "User Response"
          schema do
            key :'$ref', :User
          end
        end
      end
    end


  end 
end