require 'spec_helper'

feature "creating tweets" do
  before do 
    visit '/'
    click_link "New Tweet"
  end

  scenario "create a new tweet" do
    fill_in "Body", :with => "here is a new tweet."
    page.should have_content("Created a new tweet.")
  end
end
