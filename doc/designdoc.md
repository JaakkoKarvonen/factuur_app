<h1>FactuurApp</h1>
<i>De FactuurApp is een applicatie waarmee je eenvoudig, snel en consistent een factuur kunt aanmaken.</i>

<p>Door David de Bie & Jaakko Karvonen</p>

<h3>Features</h3>
<ul>
	<li>Aanmelden + inloggen gebruiker d.m.v. emailadres & wachtwoord.</li>
	<li>Eigen bedrijfsprofiel aanmaken: bedrijfsnaam, contactpersoon, adres, website, emailadres, telefoonnr, btw-nr, kvk-nr, rekeningnr.</li>
	<li>Factuurinstellingen wijzigen: valuta, betalingstermijn, betalingscondities, BTW-percentage.</li>
	<li>Nieuwe contacten toevoegen: bedrijfsnaam, contactpersoon, adres, emailadres, btw-nr, kvk-nr, rekeningnr.</li>
	<li>Contacten wijzigen/verwijderen.</li>
	<li>Producten toevoegen: productnaam, omschrijving, serienr, prijs.</li>
	<li>Producten wijzigen/verwijderen.</li>
	<li>Snel nieuwe factuur aanmaken d.m.v. opgeslagen bedrijfsprofiel, factuurinstellingen, contacten en producten.</li>
	<li>Facturen inzien/verwijderen/verzenden in pdf-formaat.</li>
</ul>

<h3>Frameworks, Languages & Libraries</h3>
<ul>
	<li>Ruby on Rails</li>
	<li>SQlite3</li>
	<li>HTML5</li>
	<li>Sass Bootstrap 3</li>
	<li>PDFKit</li>
	<li>Paperclip</li>
</ul>

<h3>Taakverdeling</h3>
<ul>
	<li>Home (signin/signup): David</li>
	<li>Facturen: Jaakko</li>
	<li>Contacten: Jaakko</li>
	<li>Producten: David</li>
	<li>Profiel: Jaakko</li>
	<li>Settings: David</li>
	<li>User authentication/sessions: David</li>
	<li>Relationships: Jaakko & David</li>
	<li>CSS: Jaakko</li>
</ul>

<h3>Tables</h3>
<ul>
	<li><strong>Contacts:</strong> id(int), company(str), name(str), address(str), postcode(str), city(str), kvk(int), btw(str), email(str), account(str), created_at(datetime), updated_at(datetime)</li>
	<li><strong>Products:</strong> id(int), name(str), description(str), serial(str), price(int), created_at(datetime), updated_at(datetime)</li>
	<li><strong>Users:</strong> id(int), name(str), email(str), created_at(datetime), updated_at(datetime), password_digest(str), remember_token(str)</li>
	<li><strong>Profiles:</strong> id(int), company(str), name(str), address(str), postcode(str), city(str), kvk(int), btw(str), email(str), account(str), phone(int), site(str), created_at(datetime), updated_at(datetime)</li>
	<li><strong>Invoices:</strong> id(int), contactid(int), date(date), productid(int), amount(int), created_at(datetime), updated_at(datetime)</li>
	<li><strong>+ Relational databases</strong></li>
</ul>

<h3>Models</h3>
<ul>
	<li><strong>Contacts:</strong> contact.rb</li>
	<li><strong>Invoices:</strong> invoice.rb</li>
	<li><strong>Products:</strong> product.rb</li>
	<li><strong>Profiles:</strong> profile.rb</li>
	<li><strong>Settings:</strong> setting.rb</li>
	<li><strong>Users:</strong> user.rb</li>
</ul>

<h3>Views</h3>
<ul>
	<li><strong>StaticPages:</strong> home, home_signed_in</li>
	<li><strong>Invoices:</strong> edit, index, new, show</li>
	<li><strong>Contacts:</strong> edit, index, new, show</li>
	<li><strong>Products:</strong> edit, index, new, show</li>
	<li><strong>Profiles:</strong> edit, index, new, show</li>
	<li><strong>Settings:</strong> edit, index, new, show</li>
	<li><strong>Users:</strong> edit, new, show</li>
	<li><strong>Layouts:</strong> application, _navigation, _navigation_links, _messages</li>
	<li><strong>Shared:</strong> _error_messages</li>
	<li><strong>Sessions:</strong> new +?</li>
	<li><strong></strong></li>
</ul>

<h3>Controllers</h3>
<ul>
	<li>application_controller</li>
	<li>static_pages_controller</li>
	<li>users_controller</li>
	<li>sessions_controller</li>
	<li>invoices_controller</li>
	<li>contacts_controller</li>
	<li>products_controller</li>
	<li>profiles_controller</li>
	<li>settings_controller</li>
</ul>

<h3>Helpers</h3>
<ul>
	<li>application_helper</li>
	<li>static_pages_helper</li>
	<li>users_helper</li>
	<li>sessions_helper</li>
	<li>invoices_helper</li>
	<li>contacts_helper</li>
	<li>products_helper</li>
	<li>profiles_helper</li>
	<li>settings_helper</li>
</ul>











