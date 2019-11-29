class Author < ApplicationRecord
  has_secure_password
  has_many :articles
end
