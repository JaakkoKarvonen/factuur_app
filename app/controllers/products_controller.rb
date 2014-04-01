class ProductsController < ApplicationController
  before_action :signed_in_user, only: [:index, :new, :create, :show, :delete, :edit, :update]
  
  def index
    @products = Product.where(:user_id => current_user.id)
  end
  
  def new
    @product = Product.new
  end

  def create
    params[:product][:user_id]=current_user.id
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product toegevoegd"
      redirect_to '/products'
    else
      render 'new'
    end
  end


  def show
    @product = Product.find(params[:id])
    if @product.user_id != current_user.id
      redirect_to "/products"
    end
  end

  def delete
  end

  def edit
    @product = Product.find(params[:id])
    if @product.user_id != current_user.id
      redirect_to "/products"
    end
  end

  def update
    @product = Product.find_by_id(params[:id])
    if @product.user_id != current_user.id
      redirect_to "/products"
    end
    if @product.update_attributes(product_params)
      flash[:notice] = "Product gewijzigd!"
      redirect_to "/products"
    else
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:notice] = "Product verwijderd."
    redirect_to products_url
  end

  private

  def product_params
      params.require(:product).permit(:name, :description, :serial, :price, :user_id)
  end
end
