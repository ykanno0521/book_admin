class Book < ApplicationRecord
  scope :costly, -> { where( "price > ?", 3000) }
  scope :written_about, ->(theme) { where( "name like ?", "%#{theme}%")}

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  # validate
  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0}
end


