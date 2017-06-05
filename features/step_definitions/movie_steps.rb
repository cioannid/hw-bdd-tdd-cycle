Given(/^the following movies exist:$/) do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(title: movie["title"], rating: movie["rating"], release_date: movie["release_date"], director: movie["director"])
  end
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
  # movie_path(Movie.find_by_title($1))
  if page.respond_to? :should
    page.should have_content(arg2)
  else
    assert page.has_content?(arg2)
  end
  # expect(Movie.find_by_title(arg1).director).to eq(arg2)
end