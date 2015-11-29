require 'rails_helper'

feature 'adding comments to pictures' do
  before {Picture.create name: 'bert'}

  scenario 'allows users to leave a comment on a image' do
     visit '/pictures'
     click_link 'Comment on bert'
     fill_in "Comments", with: "amazing pic"
     click_button 'Add Comment'

     expect(current_path).to eq '/pictures'
     expect(page).to have_content('amazing pic')
  end

end
