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
  	@vervaldatum = @invoice.date + @term
  	content
  end

  def content
	y_pos = cursor

	bounding_box([0, y_pos], :width => 200, :height => 150) do
	 text "#{@contact.company}
	 T.a.v. #{@contact.name}
	 #{@contact.address}
	 #{@contact.postcode} #{@contact.city}"
	end

	bounding_box([300, y_pos], :width => 200, :height => 150) do	 
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

	text "Factuurdatum: #{@invoice.date.strftime("%d-%m-%Y")}
	Factuurnummer: #{@factnr}
	Vervaldatum: #{@vervaldatum.strftime("%d-%m-%Y")}"

	move_down 20

	y_pos = 400
	bounding_box([0, y_pos], :width => 70, :height => 30) do
	  move_down 10 
	  indent(10) {text "Aantal", :style => :bold}
	  stroke_bounds
	end
	bounding_box([70, y_pos], :width => 330, :height => 30) do 
	  move_down 10 
	  indent(10) {text "Product", :style => :bold}
	  stroke_bounds
	end
	bounding_box([400, y_pos], :width => 130, :height => 30) do
	  move_down 10  
	  indent(10) {text "Bedrag in #{@currency}", :style => :bold}
	  stroke_bounds
	end
	y_pos -= 30

	@sub = 0
	@product_fields.each do |item|
		bounding_box([0, y_pos], :width => 70, :height => 30) do
		  move_down 10 
		  indent(10) {text "#{item.amount}"}
		  stroke_bounds
		end
		bounding_box([70, y_pos], :width => 330, :height => 30) do 
		  move_down 10 
		  indent(10) {text "#{Product.find(item.product).name}"}
		  stroke_bounds
		end
		bounding_box([400, y_pos], :width => 130, :height => 30) do
		  move_down 10  
		  indent(10) {text "#{@currency} #{@price = item.amount.to_i * Product.find(item.product).price}"}
		  stroke_bounds
		end
		@sub += @price
		y_pos -= 30
	end
	
	bounding_box([70, y_pos], :width => 330, :height => 24) do 
	  move_down 10 
	  indent(10) {text "Subtotaal:", :align =>:right}
	end
	bounding_box([400, y_pos], :width => 130, :height => 24) do
	  move_down 10  
	  indent(10) {text "#{@currency} #{@sub}"}
	end
	y_pos -= 24

	bounding_box([70, y_pos], :width => 330, :height => 24) do 
	  move_down 10 
	  indent(10) {text "BTW #{@btw_procent}%:", :align =>:right}
	end
	bounding_box([400, y_pos], :width => 130, :height => 24) do
	  move_down 10  
	  indent(10) {text "#{@currency} #{@btw = @btw_procent * @sub / 100}"}
	end
	y_pos -= 24

	bounding_box([70, y_pos], :width => 330, :height => 24) do 
	  move_down 10 
	  indent(10) {text "Totaal:", :align =>:right, :style => :bold}
	end
	bounding_box([400, y_pos], :width => 130, :height => 24) do
	  move_down 10  
	  indent(10) {text "#{@currency} #{@totaal = @sub + @btw}", :style => :bold}
	end
	y_pos -= 24

	y_pos -= 30
	bounding_box([0, y_pos], :width => 150, :height => 70) do
	 text "IBAN:", :align => :center, :style => :bold
	 text "#{@profile.account}", :align => :center
	end

	bounding_box([200, y_pos], :width => 150, :height => 70) do
	 text "Factuurnummer:", :align => :center, :style => :bold
	 text "#{@factnr}", :align => :center
	end

	bounding_box([400, y_pos], :width => 150, :height => 70) do
	 text "Factuurbedrag:", :align => :center, :style => :bold
	 text "#{@currency} #{@totaal}", :align => :center
	end

	text "Wij verzoeken u vriendelijk het verschuldigde bedrag binnen #{@term} "+
	"dagen over te maken onder vermelding van het factuurnummer #{@factnr}.", :align => :center, :valign => :bottom, :size => 8.5
  end
end
