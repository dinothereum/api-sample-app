unless Rails.env.production?
  SwaggerUiEngine.configure do |config|
  	config.swagger_url = {
      v1: "/api/v1/api_docs"
    }
    
    config.validator_enabled = false
    config.json_editor = true
    config.request_headers = true
  end
end