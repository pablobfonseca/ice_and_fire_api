class JSONBuilder
  def initialize(record)
    @record = record
  end

  def build_list(status_code=200, status="success")
    {
      "status_code": status_code,
      "status": status,
      "data": record.map do |book|
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
      "data": record.map do |book|
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

  def build_updated
    {
      "status_code": 200,
      "status": "success",
      "message": "The book #{record.name} was updated successfully",
      "data": {
        "id": record.id,
        "name": record.name,
        "isbn": record.isbn,
        "authors": record.authors,
        "number_of_pages": record.number_of_pages,
        "publisher": record.publisher,
        "country": record.country,
        "release_date": record.release_date
      }
    }
  end

  def build_deleted
    {
      "status_code": 204,
      "status": "success",
      "message": "The book #{record.name} was deleted successfully",
      "data": []
    }
  end

  def build_show
    {
      "status_code": 200,
      "status": "success",
      "data": {
        "id": record.id,
        "name": record.name,
        "isbn":  record.isbn,
        "authors": record.authors,
        "number_of_pages": record.number_of_pages,
        "publisher": record.publisher,
        "country": record.country,
        "release_date": record.release_date
      }
    }
  end

  private
  attr_reader :record
end
