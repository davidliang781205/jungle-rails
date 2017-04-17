require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should have name presented' do
      @cat = Category.find_or_create_by! name: 'Apparel'
      @product = @cat.products.create({
        name:  nil,
        quantity: 10,
        price: 64.99
      })
      expect(@product).to_not be_persisted
    end

    it 'should have price presented' do
      @cat = Category.find_or_create_by! name: 'Apparel'
      @product = @cat.products.create({
        name:  'Shirt',
        quantity: nil,
        price: 64.99
      })
      expect(@product).to_not be_persisted
    end

    it 'should have quantity presented' do
      @cat = Category.find_or_create_by! name: 'Apparel'
      @product = @cat.products.create({
        name:  'Shirt',
        quantity: nil,
        price: 64.99
      })
      expect(@product).to_not be_persisted
    end

    it 'should have category presented' do
      @product = Product.create({
        name:  'Shirt',
        quantity: 10,
        price: 64.99
      })
      expect(@product).to_not be_persisted
    end

    it 'should have passed' do
      @cat = Category.find_or_create_by! name: 'Apparel'
      @product = @cat.products.create({
        name:  'Shirt',
        quantity: 10,
        price: 64.99
      })
      expect(@product).to be_persisted
    end
  end
end