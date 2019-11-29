class Author < ApplicationRecord
  has_secure_password
  has_many :articles

  # validations
  validates :full_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
