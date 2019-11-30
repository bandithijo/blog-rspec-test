class Article < ApplicationRecord
  belongs_to :author

  # validations
  validates :title, presence: true,
                    length: {minimum: 5, maximum: 30}
  validates :post, presence: true,
                   length: {minimum: 5}
  validates :author_id, numericality: {only_integer: true}
end
