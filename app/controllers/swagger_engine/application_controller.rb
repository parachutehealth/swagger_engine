module SwaggerEngine
  class ApplicationController < ActionController::Base

    before_action :authenticate

    force_ssl if: :require_ssl
    def require_ssl
      SwaggerEngine.configuration.force_ssl || false
    end

    protected
    def authenticate
      if SwaggerEngine.configuration.admin_username
        authenticate_or_request_with_http_basic do |username, password|
          username == SwaggerEngine.configuration.admin_username && password == SwaggerEngine.configuration.admin_password
        end
      end
    end

  end
end
