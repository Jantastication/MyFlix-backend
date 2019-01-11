# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Rating.destroy_all
Movie.destroy_all



User.create(username: 'Janu', email: 'janu@me.com', password: 'pass')
User.create(username: 'Hannah', email: 'hannah@me.com', password: "word")
User.create(username: 'Meg', email: 'memegyou@me.com', password: '0000')
User.create(username: 'Me', email: 'me@me.com', password: '1234')
puts "There are now #{User.count} rows in the users table"

Movie.create!(title: "Guardians of the Milky way",
    year: "2017",
    rated: "PG-13",
    released: "05 May 2019",
    runtime: "136 min",
    genre: "Action, Adventure, Comedy, Sci-Fi",
    director: "James Fun",
    writer: "James funn, Dan Abnett (based on the Marvel comics by), Andy Lanning (based on the Marvel comics by), Steve Englehart (Star-Lord created by), Steve Gan (Star-Lord created by), Jim Starlin (Gamora and Drax created by), Stan Lee (Groot created by), Larry Lieber (Groot created by), Jack Kirby (Groot created by), Bill Mantlo (Rocket Raccoon created by), Keith Giffen (Rocket Raccoon created by), Steve Gerber (Howard the Duck created by), Val Mayerik (Howard the Duck created by)",
    actors: "Chris Bratt, Zoe Baldana, Dave Bautila, Vin Diz",
    plot: "The Guardians must fight to keep their newfound family together ain the milkyway.",
    language: "English",
    awards: "Nominated for 1 Oscar. Another 12 wins & 42 nominations.",
    poster: "https://m.media-amazon.com/images/M/MV5BMTg2MzI1MTg3OF5BMl5BanBnXkFtZTgwNTU3NDA2MTI@._V1_SX300.jpg",
    
    website: "https://marvel.com/guardians")
puts "There are now #{Movie.count} rows in the movies table"

Rating.create!(rating: "10", user_id: User.first.id, movie_id: Movie.first.id)
puts "There are now #{Rating.count} rows in the users table"

