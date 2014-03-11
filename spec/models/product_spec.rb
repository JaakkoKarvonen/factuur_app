require 'spec_helper'

describe Product do
  
  before { @product = Product.new(name: "New Product", description: "A new product",
  								  serial: "1234567", price: "20") }

  subject { @product }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:serial) }
  it { should respond_to(:price) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @product.name = " " }
  	it { should_not be_valid }
  end

  describe "when description is not present" do
  	before { @product.description = " " }
  	it { should_not be_valid }
  end

  describe "when serial number is not present" do
  	before { @product.serial = " " }
  	it { should_not be_valid }
  end

  describe "when price is not present" do
  	before { @product.price = " " }
  	it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @product.name = "a" * 51 }
  	it { should_not be_valid }
  end

  describe "when description is too long" do
  	before { @product.description = "a" * 201 }
  	it { should_not be_valid }
  end

  describe "when serial number is too long" do
  	before { @product.serial = "a" * 51 }
  	it { should_not be_valid }
  end
end
