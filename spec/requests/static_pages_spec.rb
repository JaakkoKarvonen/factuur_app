require 'spec_helper'

describe "StaticPages" do
  
  describe "Home Page" do

  	before { visit root_path }
  	subject { page }

  	describe "when user is not signed in" do
  	  
  	  it { should have_link("Inloggen", href: signin_path) }
  	  it { should have_link("Aanmelden", href: signup_path) }
  	end

  	describe "when user is signed in" do
  	  let(:user) { FactoryGirl.create(:user) }
  	  sign_in user

  	  it { should have_link("Nieuwe factuur", href: '#') }
  	  it { should have_link("Mijn facturen", href: '#') }
  	  it { should have_link("Contacten", href: contacts_path) }
  	end
  end
end