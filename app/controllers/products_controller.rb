class ProductsController < ApplicationController
  require 'httparty'


  def index
    if params[:search_product].present?
      response = HTTParty.get("http://localhost:3000/api/v1/products?search_product=#{params[:search_product].to_s}")
      @products = JSON.parse(response.body)

  else
    response = HTTParty.get('http://localhost:3000/api/v1/products')
    @products = JSON.parse(response.body)
  end
  
  end

end
