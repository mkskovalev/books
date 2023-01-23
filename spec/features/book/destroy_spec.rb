require 'rails_helper'

feature 'User can delete book', %q{
  In order to delete wrong book
  As a user
  I'd like to be able to delete book
} do

  given!(:book) { create(:book) }

  scenario 'delete book' do
    visit books_path
    click_on 'Delete'

    expect(page).to have_content 'Book successfully deleted.'
    expect(page).to_not have_content book.name
    expect(page).to_not have_content book.author
    expect(page).to_not have_content book.date
  end
end
