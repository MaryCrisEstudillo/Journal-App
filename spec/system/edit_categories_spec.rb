require 'rails_helper'

RSpec.describe "EditCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'edits and update the category' do
    visit '/categories/new'
    fill_in 'Title', with: 'Hello, World!'
    fill_in 'Body', with: 'Hello, I say!'
  
    click_on 'ADD'
    category = Category.order("id").last
    visit "/categories/#{category.id}/edit"
    fill_in 'Title', with: 'Hello, World edited!'
    fill_in 'Body', with: 'Hello, I say edited!'
    click_on 'UPDATE'

    expect(page).to have_content('Hello, World edited!')
    expect(page).to have_content('Hello, I say edited!')
     
    category = Category.order("id").last
    expect(category.title).to eq('Hello, World edited!')
    expect(category.body).to eq('Hello, I say edited!')
  end
end