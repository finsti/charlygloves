class Comment < ApplicationRecord

  belongs_to :product
  belongs_to :user

  scope :rating_asc, -> { order(rating: :asc) }
  scope :rating_desc, -> { order(rating: :desc) }
  
end
