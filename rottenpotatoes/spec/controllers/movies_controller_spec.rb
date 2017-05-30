require 'rails_helper'

describe MoviesController do
  describe 'finding movies with same director and the director exists' do
    before :each do
      @m = Movie.create(title: "foo", director: "Steven Spielberg")
    end
    
    it 'should call the model method that finds similar movies' do
      expect(Movie).to receive(:search_by_director).with("Steven Spielberg")
      get :similar_movies, {:id=>@m.id}
    end
    
    it 'should select the Similar Movies template for rendering' do
      expect(Movie).to receive(:search_by_director)
      get :similar_movies, {:id=>@m.id}
      expect(response).to render_template('similar_movies')
    end
    
    it 'should make the Similar Movies results available to that template' do
      fake_results = [double('Movie'), double('Movie')]
      expect(Movie).to receive(:search_by_director).and_return(fake_results)
      get :similar_movies, {:id=>@m.id}
      expect(assigns(:similar_movies)).to eq fake_results
    end
  end
end