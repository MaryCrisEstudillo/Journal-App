require 'rails_helper'

RSpec.describe "ViewCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'view a category to show the categorys details' do

    visit '/categories/new'
    fill_in 'Title', with: 'Hello, World!'
    fill_in 'Body', with: 'Hello, I say!'
    click_on 'ADD'
    
    category = Category.order("id").last
    visit "/categories/#{category.id}"
    expect(page).to have_content('Hello, I say!')
    
    category = Category.order("id").last
    expect(category.body).to eq('Hello, I say!')

  end
end