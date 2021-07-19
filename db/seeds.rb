Movie.destroy_all
Actor.destroy_all
Studio.destroy_all

# STUDIOS
universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
disney    = Studio.create(name: 'Disney', location: 'Orlando')

# MOVIES - UNIVERSAL
raiders = universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
shrek = universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

# MOVIES - DISNEY
alladin   = disney.movies.create(title: 'Alladin', creation_year: 1981, genre: 'Children')
toy_story = disney.movies.create(title: 'Toy Story 3', creation_year: 2001, genre: 'Comedy')

# ACTORS - RAIDERS
ford = raiders.actors.create!(name: 'Harrison Ford', age: 79)
freeman = raiders.actors.create!(name: 'Paul Freeman', age: 78)
allen = raiders.actors.create!(name: 'Karen Allen', age: 69)

# ACTORS - ALLADIN
jafar = alladin.actors.create!(name: 'Jafar', age: 59)

# ACTORS - TOY STORY
hanks = toy_story.actors.create!(name: 'Tom Hanks', age: 65)
