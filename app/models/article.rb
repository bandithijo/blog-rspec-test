class Article < ApplicationRecord
  belongs_to :author

  # validations
  validates :title, presence: true
  validates :post, presence: true
  validates :author_id, numericality: {only_integer: true}
end
