class Book < ApplicationRecord
  validates :name, :author, :date, presence: true
end
