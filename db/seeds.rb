universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
raiders = universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
shrek = universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

ford = raiders.actors.create!(name: 'Harrison Ford', age: 79)
freeman = raiders.actors.create!(name: 'Paul Freeman', age: 78)
allen = raiders.actors.create!(name: 'Karen Allen', age: 69)
