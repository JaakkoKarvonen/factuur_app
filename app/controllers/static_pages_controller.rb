class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  	  render 'home_signed_in'
  	end
  end
end
