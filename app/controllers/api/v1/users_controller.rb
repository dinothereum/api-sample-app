class Api::V1::UsersController < ApplicationController
  include Swagger::Blocks
  include Swagger::UsersApi

  def index
    # ...
  end

  def  show 
    # ... 
  end

  def update
  end
end