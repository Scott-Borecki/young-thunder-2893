require 'rails_helper'

RSpec.describe 'The Movie Show Page' do
  describe 'As a user, when I visit a movies show page' do
    before :each do
      @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      @raiders   = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      @shrek     = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

      @disney    = Studio.create!(name: 'Disney', location: 'Orlando')
      @alladin   = @disney.movies.create!(title: 'Alladin', creation_year: 1981, genre: 'Children')
      @toy_story = @disney.movies.create!(title: 'Toy Story 3', creation_year: 2001, genre: 'Comedy')

      @ford = @raiders.actors.create!(name: 'Harrison Ford', age: 79)
      @freeman = @raiders.actors.create!(name: 'Paul Freeman', age: 78)
      @allen = @raiders.actors.create!(name: 'Karen Allen', age: 69)
    end

    it 'displays the movies title creation year, and genre' do
      visit "/movies/#{@raiders.id}"

      expect(current_path).to eq("/movies/#{@raiders.id}")
      expect(page).to have_content(@raiders.title)
      expect(page).to have_content(@raiders.creation_year)
      expect(page).to have_content(@raiders.genre)
    end

    it 'displays all its actors' do
      visit "/movies/#{@raiders.id}"

      expect(current_path).to eq("/movies/#{@raiders.id}")
      expect(page).to have_content(@ford.name)
      expect(page).to have_content(@freeman.name)
      expect(page).to have_content(@allen.name)
    end

    it 'displays its actors from youngest to oldest'

    it 'displyas the average age of all the movies actors'
  end
end
