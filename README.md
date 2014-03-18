<h1>FactuurApp</h1>
<i>De FactuurApp is een applicatie waarmee je eenvoudig, snel en consistent een factuur kunt aanmaken.</i>

<p>Door David de Bie & Jaakko Karvonen</p>

<h3>Features</h3>
<ul>
	<li>Aanmelden + inloggen gebruiker d.m.v. emailadres & wachtwoord.</li>
	<li>Eigen bedrijfsprofiel aanmaken: naam, adres, emailadres, btw-nr, kvk-nr, rekeningnr, logo.</li>
	<li>Factuurinstellingen wijzigen: valuta, betalingstermijn, betalingscondities, BTW-percentage.</li>
	<li>Nieuwe contacten toevoegen: bedrijfsnaam, contactpersoon, adres, emailadres.</li>
	<li>Contacten wijzigen/verwijderen.</li>
	<li>Producten toevoegen: productnaam, serienr, prijs.</li>
	<li>Producten wijzigen/verwijderen.</li>
	<li>Snel nieuwe factuur aanmaken d.m.v. opgeslagen bedrijfsprofiel, factuurinstellingen, contacten en producten.</li>
	<li>Alle facturen bekijken/verwijderen via Mijn Facturen.</li>
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

