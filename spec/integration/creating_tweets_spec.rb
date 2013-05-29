require 'spec_helper'

feature "creating tweets" do
  before do 
    visit '/'
    click_link "New Tweet"
  end

  scenario "create a new tweet" do
    fill_in "Body", :with => "here is a new tweet."
    click_button "Create Tweet"
    page.should have_content("Tweet has been created.")
  end
end
