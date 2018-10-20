class Product < ApplicationRecord

  has_many :comments
  has_many :orders

  validates :name, presence: true

  def highest_rating_comment
		comments.rating_desc.first
	end

	def lowest_rating_comment
		comments.rating_asc.first
	end

  def self.search(search_term)
    if Rails.env.production?
      Product.where("name ilike ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end

  def average_rating
    comments.average(:rating).to_f
  end

end
