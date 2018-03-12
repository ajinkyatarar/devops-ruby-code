class Product < ApplicationRecord
	validates :title, presence: true, uniqueness: true, length: { maximum: 40 }
	validates :sku, presence: true, uniqueness: true, length: { maximum: 10 }
	validates :description, presence: true, length: { maximum: 255  }
end
