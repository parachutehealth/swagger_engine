module SwaggerEngine
  class Engine < ::Rails::Engine
    isolate_namespace SwaggerEngine

    initializer "swagger_engine.assets.precompile", group: :all do |app|
      app.config.assets.precompile += %w(print.css reset.css)
    end

  end

  class Configuration
    #[{ default: "swagger.json" }]
    attr_accessor :json_files
    attr_accessor :admin_username
    attr_accessor :admin_password

    attr_accessor :oauth_client_id
    attr_accessor :oauth_client_secret
    attr_accessor :oauth_app_name
    attr_accessor :oauth_realm
    attr_accessor :oauth_redirect_url

    attr_accessor :force_ssl
  end
  class << self
    attr_writer :configuration
  end

  module_function
  def configuration
    @configuration ||= Configuration.new
  end

  def configure
    yield(configuration)
  end
 end
