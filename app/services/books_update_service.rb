class BooksUpdateService
  def initialize(id, params)
    @book = Book.find(id)
    @params = params
  end

  def perform
    book.update(params)

    book
  end

  private
  attr_reader :book, :params
end
