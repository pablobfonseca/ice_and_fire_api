# Ice and Fire API
Search books on [IceAndFireAPI](https://anapioficeandfire.com)

```
GET https://iceandfireapi.herokuapp.com/api/external_books?name=A Game of
Thrones
```

```json
{
    "status_code": 200,
    "status": "success",
    "data": [
        {
            "name": "A Game of Thrones",
            "isbn": "978-0553103540",
            "authors": [
                "George R. R. Martin"
            ],
            "number_of_pages": 694,
            "publisher": "Bantam Books",
            "country": "United States",
            "release_date": "1996-08-01"
        }
    ]
}
```

## Setup

```
git clone https://github.com/pablobfonseca/ice_and_fire_api.git
cd ice_and_fire_api
bundle install
rake db:setup
rails server
```

Done, you're set, you should have your application running on http://localhost:3000 with the following endpoints:

### Create:
```
POST /api/v1/books  
parameters: {
  :name,
  :isbn,
  :authors,
  :country,
  :number_of_pages,
  :publisher,
  :release_date
}
```

### Read:
```
GET /api/v1/books  
```
You can also search by `name (string), country (string), publisher (string) and
relead_date (year, integer)`

### Update:
```
PATCH /api/v1/books/:id
```

### Delete
```
DELETE /api/v1/books/:id
```

### Show
```
GET /api/v1/books/:id
```
