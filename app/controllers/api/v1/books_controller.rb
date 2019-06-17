module API
  module V1
    class BooksController < ApplicationController
      def create
        book = BooksCreationService.new(book_params).perform
        json = book.to_json(status_code: 201, status: "success")

        render json: json, status: :created
      end

      private

      def book_params
        params.permit(:name, :isbn, :country, :number_of_pages, :publisher, :release_date, authors: [])
      end
    end
  end
end
