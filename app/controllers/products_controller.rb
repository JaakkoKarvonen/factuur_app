class ProductsController < ApplicationController
  
  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  	  flash[:success] = "Product toegevoegd"
  	  redirect_to newproduct_path
  	else
  	  render 'new'
  	end
  end

  def show
  	#@user = User.find(params[:id])
  	@products = Product.find(params[:id])
  	@products = products.paginate(page: params[:page])
  end

  def delete
  end

  def edit
  end

  private

  def product_params
      params.require(:product).permit(:name, :description, :serial, :price)
  end
end
