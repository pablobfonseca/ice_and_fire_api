class JSONBuilder
  def initialize(books)
    @books = books
  end

  def build_list(status_code=200, status="success")
    {
      "status_code": status_code,
      "status": status,
      "data": books.map do |book|
        {
          "id": book.id,
          "name": book.name,
          "isbn": book.isbn,
          "authors": book.authors,
          "number_of_pages": book.number_of_pages,
          "publisher": book.publisher,
          "country": book.country,
          "release_date": book.release_date
        }
      end
    }
  end

  def build_external_list
    {
      "status_code": 200,
      "status": "success",
      "data": books.map do |book|
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

  private
  attr_reader :books
end
