class Api::V1::ApiDocsController < ApplicationController
  include Swagger::Blocks

  swagger_root  do 
    # define meta information such as API name and version 
    key :swagger, '2.0'

    info do
      key :version, '1.0.0'
      key :title, "Next-Hero API Documents"
      key :description, "A sample API that uses a Next-Hero Project as an example to 
        demonstrate features in the swagger-2.0 specification"
    end
    
    key :basePath, '/api/v1'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  SWAGGERED_CLASSES = [
    Api::V1::UsersController,
    User,
    self,
	].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end