class BooksCreationService
  def initialize(params)
    @params = params
  end

  def perform
    Book.create(params)
  end

  private
  attr_reader :params
end
