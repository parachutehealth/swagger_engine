require_dependency "swagger_engine/application_controller"

module SwaggerEngine
  class CallbacksController < ApplicationController
    layout false

    def index
      render template: 'swagger_engine/swaggers/o2c'
    end

  end
end
