require 'rails_helper'
require 'spec_helper.rb'

#Search Feature
feature "Looking up cards", js: true do
	before do
		Card.create!(name: 'Baked Potato w/ Cheese')
		Card.create!(name: 'Garlic Mashed Potatoes')
		Card.create!(name: 'Potatoes Au Gratin')
		Card.create!(name: 'Baked Brussel Sprouts')
	end
	scenario "finding cards" do
		visit '/'
		fill_in "keywords", with: "baked"
		click_on "Search"

		expect(page).to have_content("Baked Potato")
		expect(page).to have_content("Baked Brussel Sprouts")
		expect(page).to_not have_content("Garlic Mashed Potatoes")
	end
end