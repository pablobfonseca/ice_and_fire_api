module API
  module V1
    class BooksController < ApplicationController
      def index
        books = Book.filter(filter_params)
        json  = JSONBuilder.new(books).build_list

        render json: json, status: 200
      end

      def create
        book = BooksCreationService.new(book_params).perform
        json = book.to_json(status_code: 201, status: "success")

        render json: json, status: :created
      end

      def update
        book = BooksUpdateService.new(params[:id], book_params).perform
        json = JSONBuilder.new(book).build_updated

        render json: json, status: :created
      end

      private

      def filter_params
        params.permit(:name, :country, :publisher, :release_date)
      end

      def book_params
        params.permit(:name, :isbn, :country, :number_of_pages, :publisher, :release_date, authors: [])
      end
    end
  end
end
