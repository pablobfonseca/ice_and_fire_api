module API
  class ExternalBooksController < ApplicationController
    def index
      response = ExternalBooksService.call(params)

      render json: response, status: 200
    end
  end
end
