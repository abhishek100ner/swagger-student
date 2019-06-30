class Swagger::Docs::Config
  def self.transform_path(path, api_version)
    "apidocs/#{path}"
  end
end

Swagger::Docs::Config.base_api_controller = Api::V1::ApiController

Swagger::Docs::Config.register_apis({
  '1.0' => {
    controller_base_path: '',
    api_file_path: 'public/',
    base_path: 'http://localhost:3000',
    clean_directory: true
  }
})