module Swagger::Parameters
	module Users
	  def self.extended(base)
	    base.parameter do
	    key :name, :userId
	      key :in, :path
	      key :description, "ID of User to fetch"
	      key :required, true
	      key :type, :integer
	      key :format, :int64
	    end
	  end
	end
end