class ProductsController < ApplicationController
  before_action :signed_in_user, only: [:index, :new, :create, :show, :delete, :edit, :update]
  
  def index
    @products = Product.paginate(page: params[:page])
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product toegevoegd"
      redirect_to 'products/new'
    else
      render 'new'
    end
  end


  def show
    @product = Product.find(params[:id])
  end

  def delete
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:notice] = "Productgegevens bijgewerkt"
      render 'index'
    else
      render 'edit'
    end
  end

  private

  def product_params
      params.require(:product).permit(:name, :description, :serial, :price)
  end
end
