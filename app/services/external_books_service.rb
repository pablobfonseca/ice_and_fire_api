require 'net/http'

class ExternalBooksService
  API_URL = "https://www.anapioficeandfire.com/api/books"

  class << self
    def call(params)
      uri      = URI(API_URL + "?name=#{params[:name]}")
      response = Net::HTTP.get(uri)

      format_response(response)
    end

    def format_response(response)
      books = JSON.parse(response)

      JSONBuilder.new(books).build_external_list
    end
  end
end
