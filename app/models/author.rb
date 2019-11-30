class Author < ApplicationRecord
  has_secure_password
  has_many :articles

  # validations
  validates :full_name, presence: true,
                        length: {minimum: 5, maximum: 30}

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    length: {maximum: 50},
                    format: {with: VALID_EMAIL_REGEX }

  validates :password, presence: true,
                       length: {minimum: 8}
end
