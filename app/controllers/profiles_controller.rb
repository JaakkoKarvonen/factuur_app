class ProfilesController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @profiles = Profile.paginate(page: params[:page])
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
  	@profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      flash[:notice] = "Uw profiel is succesvol aangemaakt!"
      redirect_to "/profiles"
    else
      render 'new'
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find_by_id(params[:id])
    if @profile.update_attributes(profile_params)
      flash[:notice] = "Profiel gewijzigd!"
      redirect_to "/profiles"
    else
      render 'edit'
    end
  end

  def destroy
    Profile.find(params[:id]).destroy
    flash[:notice] = "Profiel verwijderd."
    redirect_to profiles_url
  end

  private

    def profile_params
      params.require(:profile).permit(:company, :name, :address, :postcode, :city, :kvk, :btw, :email, :account, :site, :phone)
    end
end
