class InvoicePdf < Prawn::Document
  def initialize(invoice, product_fields, setting, profile, factnr)
  	super(top_margin: 70)
  	@invoice = invoice
  	@product_fields = product_fields
  	@setting = setting
  	@profile = profile
  	@factnr = factnr
  	@contact = Contact.find(@invoice.contact_id)
  	@currency = @setting.currency
  	@btw_procent = @setting.btw
  	@term = @setting.term
  	content
  end

  def content
	y_position = cursor

	bounding_box([0, y_position], :width => 200, :height => 150) do
	 text "#{@contact.company}
	 T.a.v. #{@contact.name}
	 #{@contact.address}
	 #{@contact.postcode} #{@contact.city}"
	end

	bounding_box([300, y_position], :width => 200, :height => 150) do	 
	 text "#{@profile.company}
			#{@profile.address}
			#{@profile.postcode} #{@profile.city}
			#{@profile.site}
			#{@profile.email}
			Kvk: #{@profile.kvk}
			BTW: #{@profile.btw}
			IBAN: #{@profile.account}
			Tel: #{@profile.phone}"
	end

	move_down 20

	text "Factuur", :size => 18

	move_down 12

	text "Factuurdatum: #{@invoice.date}
	Factuurnummer: #{@factnr}
	Vervaldatum #{@invoice.date + @term}"

	move_down 20

	bounding_box([0, 200], :width => 150, :height => 70) do
	 text "IBAN:", :align => :center, :style => :bold
	 text "#{@profile.account}", :align => :center
	end

	bounding_box([200, 200], :width => 150, :height => 70) do
	 text "Factuurnummer:", :align => :center, :style => :bold
	 text "#{@factnr}", :align => :center
	end

	bounding_box([400, 200], :width => 150, :height => 70) do
	 text "Factuurbedrag:", :align => :center, :style => :bold
	 text "#{@currency} xxx", :align => :center
	end


	text "Wij verzoeken u vriendelijk het verschuldigde bedrag binnen #{@term} "+
	"dagen over te maken onder vermelding van het factuurnummer #{@factnr}.", :align => :center, :size => 8.5

  end

   
end
