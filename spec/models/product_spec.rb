require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'is valid with valid attributes' do
      @product = Product.new
      @product.name = "Green Grass"
      @product.price = 6499
      @product.quantity = 10
      @product.category = Category.create(name: "Test")
      expect(@product).to be_valid
    end

    it 'is invalid with no name' do
      @product = Product.new
      @product.name = nil
      @product.price = 6499
      @product.quantity = 10
      @product.category = Category.create(name: "Test")
      expect(@product).not_to be_valid
    end

    it 'is invalid with no price' do
      @product = Product.new
      @product.name = "Green Grass"
      @product.price
      @product.quantity = 10
      @product.category = Category.create(name: "Test")
      expect(@product).not_to be_valid
    end

    it 'is invalid with no quantity' do
      @product = Product.new
      @product.name = "Green Grass"
      @product.price = 6499
      @product.quantity = nil
      @product.category = Category.create(name: "Test")
      expect(@product).not_to be_valid
    end

    it 'is invalid with no category' do
      @product = Product.new
      @product.name = "Green Grass"
      @product.price = 6499
      @product.quantity = 10
      @product.category = nil
      expect(@product).not_to be_valid
    end

  end
end