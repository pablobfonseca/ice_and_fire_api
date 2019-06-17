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
      parsed = JSON.parse(response)

      {
        "status_code": 200,
        "status": "success",
        "data": parsed.map do |book|
          {
            "name": book["name"],
            "isbn": book["isbn"],
            "authors": book["authors"],
            "number_of_pages": book["numberOfPages"],
            "publisher": book["publisher"],
            "country": book["country"],
            "release_date": book["released"].to_date.strftime("%Y-%m-%d")
          }
        end
      }
    end
  end
end
