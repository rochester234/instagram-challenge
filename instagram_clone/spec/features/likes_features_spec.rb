require 'rails_helper'

feature 'like a picture' do
  before do
    bert = Picture.create(name: 'bert', comments: 'i love this picture')
  end

  it 'a user can like a picture, which increments the like count', js: true do
    visit '/pictures'
    within('#pic-link') do
      click_link "Like"
    end
    expect(page).to have_content("1 like")
  end

end
