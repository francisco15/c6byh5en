module Api
	module V1
		class ProductsController < ApplicationController
			protect_from_forgery with: :null_session

			before_action :set_product, only: [:update, :destroy]

			def index
				render json: Product.all
			end

			def create
				product = Product.new(product_params)
				if product.save
					render json: product, status: :created #201
				else
					render json: {errors: product.errors}, status: :unprocessable_entity #422
				end
			end

			def update
				if @product.update(product_params)
					render json: @product, status: :ok #200
				else 
					render json: { errors: @product.errors }, status: :unprocessable_entity #422
				end
			end

			def destroy
				@product.destroy
				head :no_content #204
			end

			private
				def set_product
      		@product = Product.find(params[:id])
    		end
				
				def product_params
					params.require(:product).permit(:name, :price)
				end
		end
	end
end