class Book < ApplicationRecord
  belongs_to :reviewer
  has_many :notes
end
