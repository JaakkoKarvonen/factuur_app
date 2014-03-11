class ContactsController < ApplicationController
  def show
    @contact = Contact.find(params[:id])
  end

  def new
  	@contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Contact is succesvol toegevoegd!"
      redirect_to @contact
    else
      render 'new'
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:company, :name, :address, :postcode, :city, :kvk, :btw, :email, :account)
    end
end