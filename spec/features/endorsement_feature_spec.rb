require 'rails_helper'

feature 'endorsing reviews' do
  before do
    user = User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
    kfc = user.restaurants.create(name: 'KFC')
    kfc.reviews.create(user_id: user.id, rating: 3, thoughts: 'It was an abomination')
  end

  scenario 'a user can endorse a review, which updates the review endorsement count', js: true do
    visit '/restaurants'
    click_link 'Endorse Review'
    expect(page).to have_content('1 endorsement')
  end

  scenario 'the page displays the correct number of endorsements', js: true do
    visit '/restaurants'
    click_link 'Endorse Review'
    click_link 'Endorse Review'
    expect(page).to have_content('2 endorsements')
  end
end
