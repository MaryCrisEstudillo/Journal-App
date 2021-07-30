require 'rails_helper'

RSpec.describe "EditCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'view a category to show the categorys details' do
    
    visit '/categories/new'
    fill_in 'Title', with: 'Hello, World!'
    fill_in 'Body', with: 'Hello, I say!'
  
    click_on 'ADD'
    
    categoryId = Category.order("id").last
    visit "/categories/#{categoryId}"
    expect(page).to have_content('Hello, World!')
    category = Category.find(id)
    expect(category.description).to eq('Hello, I say!')


  end
end