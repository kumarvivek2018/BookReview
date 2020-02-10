class Reviewer < ApplicationRecord
  has_many :books
  has_many :notes, through: :books
end
