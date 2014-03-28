class SettingsController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
  	if @setting.nil?
  	  redirect_to new_setting_path
  	else
  	  redirect_to edit_setting_path
  	end
  end

  def new
  	@setting = Setting.new
  end

  def edit
  end

  def create
    params[:setting][:user_id]=current_user.id
    print params
    @setting = Setting.new(setting_params)
    if @setting.save
      flash[:notice] = "Instellingen opgeslagen!"
      redirect_to "/home"
    else
      render 'new'
    end
  end


  private

    def setting_params
    	params.require(:setting).permit(:currency, :term, :btw, :user_id)
    end

end
