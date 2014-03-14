class ContactsController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    #@contacts = Contact.all
    @contacts = Contact.paginate(page: params[:page])
  end

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

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find_by_id(params[:id])
    if @contact.update_attributes(contact_params)
      flash[:notice] = "Contact gewijzigd!"
      redirect_to @contact
    else
      render 'edit'
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    flash[:notice] = "Contact verwijderd."
    redirect_to contacts_url
  end

  private

    def contact_params
      params.require(:contact).permit(:company, :name, :address, :postcode, :city, :kvk, :btw, :email, :account)
    end
end