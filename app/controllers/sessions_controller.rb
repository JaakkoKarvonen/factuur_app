class SessionsController < ApplicationController
  before_action :signed_in_user, only: :destroy

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      render 'static_pages/home_signed_in'
    else
      flash[:error] = 'Email/gebruikersnaam ongeldig'
      render 'new'
    end
  end

  def destroy
  	sign_out
  	redirect_to root_url
  end
end
