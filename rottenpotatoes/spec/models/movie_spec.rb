require 'rails_helper'

describe Movie do
  describe 'finding movies of the same director' do
    before :each do
      @m1 = Movie.create(title: "foo", director: "Steven Spielberg")
      
      @m2 = Movie.create(title: "bar", director: "Steven Spielberg")
      
      @m3 = Movie.create(title: "baz", director: "Roman Polanski")

    end
    
    it 'should find movies by the same director' do
      result = Movie.search_by_director "Steven Spielberg"
      expect(result).to include(@m1, @m2)
    end
    
    it 'should not find movies by different directors' do
      result = Movie.search_by_director "Steven Spielberg"
      expect(result).not_to include(@m3)
    end
  end
end