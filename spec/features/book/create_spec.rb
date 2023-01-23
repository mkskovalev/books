require 'rails_helper'

feature 'User can create book', %q{
  In order to complete the collection of books
  As an user
  I'd like to be able to add book
} do

  scenario 'create new book' do
    visit new_book_path
    fill_in 'Name', with: 'Some New Book'
    fill_in 'Author', with: 'Some Author'
    fill_in 'Date', with: 1998
    click_on 'Save'

    expect(page).to have_content 'New book successfully created.'
  end

  scenario 'create new book with errors' do
    visit new_book_path
    click_on 'Save'

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Author can't be blank"
    expect(page).to have_content "Date can't be blank"
  end
end
