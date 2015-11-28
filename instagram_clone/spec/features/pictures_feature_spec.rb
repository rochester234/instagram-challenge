require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_button 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(name: 'bert')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('bert')
      expect(page).not_to have_content('No pictures yet')
    end
  end
  context 'creating pictures' do
    scenario 'prompts user to add a picture, then displays the new picture' do
      visit '/pictures'
      click_button 'Add a picture'
      fill_in 'Name', with: 'bert'
      click_button 'Add picture'
      expect(page).to have_content 'bert'
      expect(current_path).to eq '/pictures'
    end
  end
  




end
