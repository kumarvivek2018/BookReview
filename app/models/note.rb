class Note < ApplicationRecord
  belongs_to :book
  validates :title, :note, presence: true
end
