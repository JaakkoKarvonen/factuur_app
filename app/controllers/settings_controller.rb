class SettingsController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
  	@setting = Setting.paginate(page: params[:page])
  end
end
