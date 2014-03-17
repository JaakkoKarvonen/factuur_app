class InvoicesController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @invoices = Invoice.paginate(page: params[:page])
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
  	@invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      flash[:notice] = "Factuur is succesvol aangemaakt!"
      redirect_to "/invoices"
    else
      render 'new'
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find_by_id(params[:id])
    if @invoice.update_attributes(invoice_params)
      flash[:notice] = "Factuur gewijzigd!"
      redirect_to "/invoices"
    else
      render 'edit'
    end
  end

  def destroy
    Invoice.find(params[:id]).destroy
    flash[:notice] = "Factuur verwijderd."
    redirect_to invoices_url
  end

  private

    def invoice_params
      params.require(:invoice).permit(:contactid, :date, :productid, :amount)
    end
end