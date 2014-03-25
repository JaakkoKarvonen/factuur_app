class SettingsController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :new, :edit, :update,]

  def index
  	@setting = Setting.paginate(page: params[:page])
  end

  def new
  	@setting = Setting.new
  end

  def edit
  end
end
