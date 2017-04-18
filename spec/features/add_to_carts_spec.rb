require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Product details", js: true do
    # ACT
    visit root_path
    # DEBUG
    products = page.all('footer')
    within(products[0]) do
      click_link('Add')
    end
    save_screenshot

  end
end
