require 'rails_helper'

RSpec.describe "CreateCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and displays the resulting Category' do
      visit '/categories/new'
  
      fill_in 'Title', with: 'Hello, World!'
      fill_in 'Body', with: 'Hello, I say!'
    
      click_on 'ADD'
    
      expect(page).to have_content('Hello, World!')
      expect(page).to have_content('Hello, I say!')
    
      category = Category.order("id").last
      expect(category.title).to eq('Hello, World!')
      expect(category.body).to eq('Hello, I say!')
  end
end
