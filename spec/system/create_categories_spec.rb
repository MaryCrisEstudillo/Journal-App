require 'rails_helper'

RSpec.describe "CreateCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'create and show category' do
    visit '/categories/new'
    fill_in 'Title', with: 'category title'
    fill_in 'Body', with: 'category body'
    
    click_on 'ADD'
    expect(page).to have_content('category title')
    expect(page).to have_content('category body')
    
    category = Category.order("id").last
    expect(category.title).to eq('category title')
    expect(category.body).to eq('category body')
  end

end
