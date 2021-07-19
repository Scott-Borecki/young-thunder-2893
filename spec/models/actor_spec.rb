require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many(:movie_actors) }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe 'class methods' do
    before :each do
      @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      @raiders   = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      @shrek     = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

      @ford = @raiders.actors.create!(name: 'Harrison Ford', age: 79)
      @freeman = @raiders.actors.create!(name: 'Paul Freeman', age: 78)
      @allen = @raiders.actors.create!(name: 'Karen Allen', age: 69)
    end

    describe '#by_movie' do
      it 'can return the actors by movie' do
        expect(Actor.by_movie(@raiders)).to eq([@ford, @freeman, @allen])
      end
    end
  end
end
