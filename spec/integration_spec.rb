require 'rails_helper'

RSpec.feature 'Integrations', type: :feature do
  scenario 'Log in as a saved user' do
    User.create(name: 'Foobar', email: 'goobar@example.org')
    visit login_path
    have_link 'Log in', href: login_path
    have_link 'Events', href: events_path
    page.fill_in 'Email', with: 'goobar@example.org'
    click_button 'Log in'
    expect(page.current_path).to eq '/users/1'
    have_link 'Post', href: events_path
    have_link("Log out", :href => "/logout")
    have_link 'Events', href: events_path
  end
end
