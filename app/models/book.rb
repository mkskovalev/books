class Book < ApplicationRecord
  include Filterable

  validates :name, :author, :date, presence: true

  scope :filter_by_name, -> (name) { where("name like ?", "%#{name}%") }
  scope :filter_by_author, -> (author) { where author: author }
  scope :filter_by_min_year, -> (min_year) { where('date >= ?', min_year) }
  scope :filter_by_max_year, -> (max_year) { where('date <= ?', max_year) }
end
