class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show, :edit, :update,]
  before_action :correct_user, only: [:show, :edit, :update]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:notice] = "Welkom"
      redirect_to "/profiles/new"
    else
      render 'new'
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "Gegevens bijgewerkt"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # if user is not signed in, redirect to signin page
    def signed_in_user
      redirect_to signin_url, notice: "Log in a.u.b." unless signed_in?
    end

    #allow only the right user to access personal pages
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
