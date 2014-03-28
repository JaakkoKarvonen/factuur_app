class ContactsController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  

  def index
    #@contacts = Contact.paginate(page: params[:page])
    @contacts = Contact.where(:user_id => current_user.id)
  end

  def show
    @contact = Contact.find(params[:id])
    if @contact.user_id != current_user.id
      redirect_to "/contacts"
    end

  end

  def new
  	@contact = Contact.new
  end

  def create
    params[:contact][:user_id]=current_user.id
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Contact is succesvol toegevoegd!"
      redirect_to "/contacts"
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    if @contact.user_id != current_user.id
      redirect_to "/contacts"
    end

  end

  def update
    @contact = Contact.find_by_id(params[:id])
    if @contact.user_id != current_user.id
      redirect_to "/contacts"
    end

    if @contact.update_attributes(contact_params)
      flash[:notice] = "Contact gewijzigd!"
      redirect_to "/contacts"
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
      params.require(:contact).permit(:company, :name, :address, :postcode, :city, :kvk, :btw, :email, :account, :user_id)
    end
end