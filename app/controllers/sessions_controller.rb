class SessionsController < ApplicationController
  before_action :signed_in_user, only: :destroy

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_url
    else
      flash[:error] = 'Email/gebruikersnaam ongeldig'
      render 'new'
    end
  end

  def destroy
  	sign_out
    flash[:notice] = "Succesvol uitgelogd"
  	redirect_to root_url
  end
end
