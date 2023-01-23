require 'rails_helper'

feature 'User can filter books', %q{
  In order to find books by conditions
  As a user
  I'd like to be able to filter books
} do

  given!(:book_1) { create(:book, name: 'Best book in the world', author: 'Edwig Smith', date: 1896)}
  given!(:book_2) { create(:book, name: 'New story of planet', author: 'Robert Matz', date: 1952)}
  given!(:book_3) { create(:book, name: 'Ladies letters', author: 'Diana Bart', date: 2002)}

  background { visit books_path }

  scenario 'find book by name' do
    fill_in 'name', with: 'story'
    click_on 'Filter'

    expect(page).to have_content 'New story of planet'
    expect(page).to_not have_content 'Best book in the world'
    expect(page).to_not have_content 'Ladies letters'
  end

  scenario 'find book by author' do
    select 'Diana Bart', from: 'author'
    click_on 'Filter'

    expect(page).to_not have_content 'New story of planet'
    expect(page).to_not have_content 'Best book in the world'
    expect(page).to have_content 'Ladies letters'
  end

  scenario 'find book by year published' do
    fill_in 'min_year', with: 1920
    fill_in 'max_year', with: 1990
    click_on 'Filter'

    expect(page).to have_content 'New story of planet'
    expect(page).to_not have_content 'Best book in the world'
    expect(page).to_not have_content 'Ladies letters'
  end
end
