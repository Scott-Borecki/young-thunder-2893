require 'rails_helper'

RSpec.describe 'The Actor Show Page' do
  describe 'As a user, when I visit an actors show page' do
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

      @jafar = @alladin.actors.create!(name: 'Jafar', age: 59)

      visit "/actors/#{@ford.id}"
    end

    it 'displays the actors name and age' do
      expect(current_path).to eq("/actors/#{@ford.id}")
      expect(page).to have_content(@ford.name)
      expect(page).to have_content(@ford.age)
    end

    it 'displays a unique list of all the actors worked with' do
      expect(current_path).to eq("/actors/#{@ford.id}")
      expect(page).to have_content(@freeman.name)
      expect(page).to have_content(@allen.name)
      expect(page).to_not have_content(@jafar.name)
    end
  end
end
