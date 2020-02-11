class Book < ApplicationRecord
  belongs_to :reviewer
  has_many :notes

  validates :name, :author, presence: true
end
