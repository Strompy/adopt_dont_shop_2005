require 'rails_helper'

RSpec.describe "Shelter show page" do
  it "shows name, address, city, state, zip for a particular shelter" do
    shelter_1 = Shelter.create(name: "Hope", address: "123 Main Street", city: "Denver", state: "CO", zip_code: 80202)
    shelter_2 = Shelter.create(name: "Paw Pals", address: "666 Wall Street", city: "Denver", state: "CO", zip_code: 80204)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip_code)
    expect(page).not_to have_content(shelter_2.name)
  end
end


# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
# - name
# - address
# - city
# - state
# - zip
