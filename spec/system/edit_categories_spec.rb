require 'rails_helper'

RSpec.describe "EditCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'edit to update the category details' do
    visit '/categories/new'
    fill_in 'Title', with: 'category title'
    fill_in 'Body', with: 'category body'
    click_on 'ADD'
    
    category = Category.order("id").last
    visit "/categories/#{category.id}/edit"
    fill_in 'Title', with: 'category title edited'
    fill_in 'Body', with: 'category body edited'
    click_on 'UPDATE'

    expect(page).to have_content('category title edited')
    expect(page).to have_content('category body edited')
     
    category = Category.order("id").last
    expect(category.title).to eq('category title edited')
    expect(category.body).to eq('category body edited')
  end
end