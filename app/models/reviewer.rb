class Reviewer < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :notes, through: :books

  has_secure_password

  validates :name, :username, :password, presence: true
  validates :username, uniqueness: {message: "already exists"}
end
