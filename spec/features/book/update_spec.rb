require 'rails_helper'

feature 'User can edit book', %q{
  In order to correct mistakes
  As an user
  I'd like to be able to edit book
} do

  given(:book) { create(:book) }

  scenario 'edit book' do
    visit edit_book_path(book)
    fill_in 'Name', with: 'Some New Title'
    click_on 'Save'

    expect(page).to have_content 'Book successfully updated.'
    expect(page).to have_content 'Some New Title'
    expect(page).to_not have_content book.name
  end

  scenario 'edit book with errors' do
    visit edit_book_path(book)
    fill_in 'Name', with: ''
    click_on 'Save'

    expect(page).to have_content "Name can't be blank"
  end
end
