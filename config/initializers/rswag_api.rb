Rswag::Api.configure do |c|
  # Specify a root folder where OpenAPI JSON files are located
  # This is used by the OpenAPI middleware to serve requests for API descriptions
  # NOTE: If you're using rswag-specs to generate OpenAPI files, you'll need to ensure
  # that it's configured to generate files in the same folder
  c.openapi_root = Rails.root.join('swagger') # Use join for path concatenation
end