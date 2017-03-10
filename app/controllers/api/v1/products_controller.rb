module Api
	module V1
		class ProductsController < ApplicationController

			def index
				render json: Product.all
			end

		end
	end
end