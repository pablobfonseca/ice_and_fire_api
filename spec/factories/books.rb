FactoryBot.define do
  factory :book do
    name { "The Rogue Prince" }
    isbn { "978-0345537263" }
    authors { ["George R. R. Martin"] }
    country { "United States" }
    number_of_pages { "832" }
    publisher { "Bantam Books" }
    release_date { "1996-08-01" }
  end
end
