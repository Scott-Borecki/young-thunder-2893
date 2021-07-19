require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many(:movie_actors) }
    it { should have_many(:actors), through: :movie_actors }
  end

  describe 'class methods' do
    before :each do
      @universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
      @raiders   = @universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      @shrek     = @universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

      @disney    = Studio.create(name: 'Disney', location: 'Orlando')
      @alladin   = @disney.movies.create(title: 'Alladin', creation_year: 1981, genre: 'Children')
      @toy_story = @disney.movies.create(title: 'Toy Story 3', creation_year: 2001, genre: 'Comedy')
    end

    describe '#by_studio' do
      it 'can return movies by studio' do
        expect(Movie.by_studio(@universal)).to eq([@raiders, @shrek])
        expect(Movie.by_studio(@disney)).to eq([@alladin, @toy_story])
      end
    end
  end
end
