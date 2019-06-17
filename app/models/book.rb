class Book < ApplicationRecord
  scope :by_name, -> (name) { where(name: name) }
  scope :by_country, -> (country) { where(country: country) }
  scope :by_publisher, -> (publisher) { where(publisher: publisher) }
  scope :by_release_date, -> (release_date) { where("EXTRACT(YEAR from (release_date)::DATE) = ?", release_date) }

  def self.filter(filtering_params)
    books = all
    filtering_params.each do |key, value|
      books = books.public_send("by_#{key}", value) if value.present?
    end

    books
  end

  def as_json(options={})
    {
      data: {
        book: super(except: [:id, :created_at, :updated_at])
      }
    }.reverse_merge(options)
  end
end
