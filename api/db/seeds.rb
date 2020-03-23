# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: "John Smith", email: "john@funds.com", password_digest: BCrypt::Password.create("1"))
Shop.create(title: "Shop1", location: "Vancouver", created_by: user1.id.to_s)
Shop.create(title: "Shop2", location: "Texas", created_by: user1.id.to_s)

user2 = User.create(name: "Jane Doe", email: "jane@funds.com", password_digest: BCrypt::Password.create("1"))
Shop.create(title: "Shop3", location: "New York", created_by: user2.id.to_s)
Shop.create(title: "Shop3", location: "Colorado", created_by: user2.id.to_s)

data = {
        "2020-03-23 15:15:00": {
            "1. open": "135.4578",
            "2. high": "135.6200",
            "3. low": "134.8000",
            "4. close": "135.1547",
            "5. volume": "548465"
        },
        "2020-03-23 15:10:00": {
            "1. open": "136.6700",
            "2. high": "136.7000",
            "3. low": "135.4100",
            "4. close": "135.4400",
            "5. volume": "454088"
        },
        "2020-03-23 15:05:00": {
            "1. open": "135.4600",
            "2. high": "136.7000",
            "3. low": "135.0900",
            "4. close": "136.6500",
            "5. volume": "535953"
        },
        "2020-03-23 15:00:00": {
            "1. open": "136.1500",
            "2. high": "136.6300",
            "3. low": "135.4100",
            "4. close": "135.4300",
            "5. volume": "401512"
        }
      }

Stock.create(symbol: "MSFT", function: "TIME_SERIES_INTRADAY", data: data)