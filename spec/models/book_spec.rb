require 'rails_helper'

describe Book, type: :model do
  describe '.filter' do
    it 'filters by name' do
      create(:book, name: "Harry Potter")

      expect(described_class.filter(name: 'Harry Potter').size).to eq 1
    end

    it 'filters by country' do
      create(:book, country: "Brazil")

      expect(described_class.filter(country: 'Brazil').size).to eq 1
    end

    it 'filters by publisher' do
      create(:book, publisher: "Novatec")

      expect(described_class.filter(publisher: 'Novatec').size).to eq 1
    end

    it 'filters by release_date (year)' do
      create(:book, release_date: "2019-01-01")
      create(:book, release_date: "2018-01-01")

      expect(described_class.filter(release_date: 2019).size).to eq 1
    end
  end

  describe '#as_json' do
    it 'returns the formatted json representation' do
      book = create(:book)
      json = book.to_json(status_code: 201, status: "success")

      expect(JSON.parse(json, symbolize_names: true))
        .to eq load_json_from("spec/fixtures/creating/success.json")
    end
  end
end
