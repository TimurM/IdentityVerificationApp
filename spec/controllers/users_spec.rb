require "rails_helper"
require "spec_helper"

RSpec.describe UsersController, :type => :controller do
  describe "GET #NEW" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
end

RSpec.describe "Response", :type => :request do
  it "displays the user's JSON object after successful login" do
    user = FactoryGirl.create(:user, :first_name => "Kristy", :last_name => "Macejkovic", :ip_address => "204.57.220.1")

    visit "/users/new"
    fill_in "First_name", :with => "Kristy"
    fill_in "Last_name", :with => "Macejkovic"
    fill_in "Ip_address", :with => "204.57.220.1"
    click_button "Check Identity"

    expect(page).to have_selector(".header, .first_name", :text => "Kristy")
  end
end
