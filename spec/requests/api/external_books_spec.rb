require 'rails_helper'

describe 'Request to external books' do
  describe 'GET external-books' do
    it 'returns a list of books with the given name' do
      VCR.use_cassette('external-books') do
        get api_external_books_path, params: { name: 'A Game Of Thrones' }

        expect(response).to have_http_status(:success)
        expect(response_body[:status_code]).to eq 200
        expect(response_body[:status]).to eq "success"
      end
    end

    it 'returns empty array on data node when no results' do
      VCR.use_cassette('external-books-no-results') do
        get api_external_books_path, params: { name: 'Foo and Bar' }

        expect(response).to have_http_status(:success)
        expect(response_body[:status_code]).to eq 200
        expect(response_body[:status]).to eq "success"
        expect(response_body[:data]).to be_empty
      end
    end
  end
end
