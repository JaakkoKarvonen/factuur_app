class InvoicesController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @invoices = Invoice.where(:user_id => current_user.id)
  end

  def show
    @invoice = Invoice.find(params[:id])
    if @invoice.user_id != current_user.id
      redirect_to "/invoices"
    end
    @product_fields = ProductField.where(:invoice_id => @invoice.id)
    @setting = current_user.setting
    @profile = current_user.profile
    @factnr = Time.now.year.to_s + @invoice.id.to_s.rjust(3, '0')
    respond_to do |format|
      format.html
      format.pdf do
        pdf = InvoicePdf.new(@invoice, @product_fields, @setting, @profile, @factnr)
        send_data pdf.render, filename: "factuur_#{@factnr}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def new
    if current_user.contacts.empty?
      redirect_to "/contacts/new"
      flash[:error] = "U heeft nog geen contacten. Maak een contact aan."
    elsif current_user.products.empty?
      redirect_to "/products/new"
      flash[:error] = "U heeft nog geen producten. Maak een product aan."
    else
      @invoice = Invoice.new
      @contact = Contact.where(:user_id => current_user.id)
      @product = Product.where(:user_id => current_user.id)
    end
  end

  def create
    params[:invoice][:user_id]=current_user.id
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to @invoice
    else
      render 'new'
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
    if @invoice.user_id != current_user.id
      redirect_to "/invoices"
    end
  end

  def update
    @invoice = Invoice.find_by_id(params[:id])
    if @invoice.update_attributes(invoice_params)
      flash[:notice] = "Factuur is succesvol aangemaakt!"
      redirect_to "/invoices"
    else
      render 'edit'
    end
  end

  def destroy
    Invoice.find(params[:id]).destroy
    redirect_to invoices_url
  end

  private

    def invoice_params
      params.require(:invoice).permit(:date, :contact_id, :user_id, fields_attributes: [:product, :amount])
    end
end