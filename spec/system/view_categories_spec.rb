require 'rails_helper'

RSpec.describe "ViewCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'view a category to show the categorys details' do

    visit '/categories/new'
    fill_in 'Title', with: 'category title'
    fill_in 'Body', with: 'category body'
    click_on 'ADD'
    
    category = Category.order("id").last
    visit "/categories/#{category.id}"
    expect(page).to have_content('category body')
    
    category = Category.order("id").last
    expect(category.body).to eq('category body')

  end
end