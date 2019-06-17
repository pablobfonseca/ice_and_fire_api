FactoryBot.define do
  factory :book do
    name { "The Rogue Prince" }
    isbn { "978-0345537263" }
    authors { ["George R. R. Martin"] }
    country { "United States" }
    number_of_pages { "832" }
    publisher { "Bantam Books" }
    release_date { "1996-08-01" }

    factory :game_of_thrones_book do
      name { "A Game of Thrones" }
      isbn { "978-0553103540" }
      authors { [ "George R. R. Martin" ] }
      number_of_pages { 694 }
      publisher { "Bantam Books" }
      country { "United States" }
      release_date { "1996-08-01" }
    end

    factory :clash_of_kings_book do
      name { "A Clash of Kings" }
      isbn { "978-0553108033" }
      authors { [ "George R. R. Martin" ] }
      number_of_pages { 768 }
      publisher { "Bantam Books" }
      country { "United States" }
      release_date { "1999-02-02" }
    end
  end
end
