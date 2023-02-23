module Api
  module V1
    class ProductsController < V1Controller
      
      def index
        @products = Product.all
        if params[:search_product].present?
          if params[:search_product] == params[:search_product].reverse && params[:search_product].length >= 3
            @products= Product.where("branch LIKE ? OR description LIKE ?","%#{params[:search_product]}%","%#{params[:search_product]}%")
            @products = Product.calculate_offert(@products)
          elsif params[:search_product].length >= 3 
            @products= Product.where("branch LIKE ? OR description LIKE ?","%#{params[:search_product]}%","%#{params[:search_product]}%")
          elsif params[:search_product].to_i >= 1
            @products = Product.find(params[:search_product])
          else
            @products = Product.all
          end
        end
        render :json => @products.to_json(only: %i[id branch description price])
      end



      def create
        @product = Product.new(product_params)
        if @product.save
          render json: @product
        else
          render json: @product.errors
        end
      end

      def destroy
        @product.destroy
        render json: "destroyed product"
      end

      private

      def set_product
        @product = product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:branch, :description, :price)        
      end

    end
  end
end
