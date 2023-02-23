class Product < ApplicationRecord

    def self.calculate_offert(products)
        new_products= products.each{|product| product.price = product.price*0.5}
        return new_products
    end
end
