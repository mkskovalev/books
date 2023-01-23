class ChartsController < ApplicationController
  def index
    @books_by_years = Book.group(:date).count
  end
end
