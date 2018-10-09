class Product < ApplicationRecord
  def self.search(search_term)
    Product.where("lower(name) LIKE lower(?)", "%#{search_term}%")
  end
end
