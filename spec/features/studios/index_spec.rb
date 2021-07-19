require 'rails_helper'

RSpec.describe 'The Studio Index Page' do
  describe 'As a user, when I visit the studio index page' do
    before :each do
      @universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
      @raiders   = @universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      @shrek     = @universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

      @disney    = Studio.create(name: 'Disney', location: 'Orlando')
      @alladin   = @disney.movies.create(title: 'Alladin', creation_year: 1981, genre: 'Children')
      @toy_story = @disney.movies.create(title: 'Toy Story 3', creation_year: 2001, genre: 'Comedy')
    end

    it 'displays the name, location, and movie titles of each studio' do
      visit '/studios'

      expect(current_path).to eq('/studios')
      expect(page).to have_content(@universal.name)
      expect(page).to have_content(@universal.location)
      expect(page).to have_content(@universal.location)
      expect(page).to have_content(@raiders.title)
      expect(page).to have_content(@shrek.title)

      expect(page).to have_content(@disney.name)
      expect(page).to have_content(@disney.location)
      expect(page).to have_content(@disney.location)
      expect(page).to have_content(@alladin.title)
      expect(page).to have_content(@toy_story.title)
    end
  end

end
