class Comment < ApplicationRecord

  belongs_to :product
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  scope :rating_asc, -> { order(rating: :asc) }
  scope :rating_desc, -> { order(rating: :desc) }

end
