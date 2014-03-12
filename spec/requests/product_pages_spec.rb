require 'spec_helper'

describe "Products" do

  subject { page }
  
  describe "New product" do
  	before { visit newproduct_path }

  	it { should have_content('Nieuw product') }
  	it { should have_title('Nieuw product') }
  end

  describe "My products" do
  	before { visit myproducts_path }

  	it { should have_content('Mijn producten') }
  	it { should have_title('Mijn producten') }
  end
end