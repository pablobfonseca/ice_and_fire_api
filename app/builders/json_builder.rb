class JSONBuilder
  def initialize(record)
    @record = record
  end

  def build_list
    {
      "status_code": 200,
      "status": "success",
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
    build_resource_default({
        "status_code": 200,
        "status": "success",
        "message": I18n.t('updated', name: record.name)
      })
  end

  def build_deleted
    {
      "status_code": 204,
      "status": "success",
      "message": I18n.t('deleted', name: record.name),
      "data": []
    }
  end

  def build_show
    build_resource_default({
      "status_code": 200,
      "status": "success",
    })
  end

  private
  attr_reader :record

  def build_resource_default(options={})
    {
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
    }.reverse_merge(options)
  end
end
