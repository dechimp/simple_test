require 'spec_helper'

describe "can I log in?", :type => :feature do
  # swap comment status on below two lines to enable toggle 
  # between Selenium and Capybara. the `:js => true` is Selenium
  #it "doesn't log in with bad credentials", :js => true do
  it "doesn't log in with bad credentials" do
    #init user data
    users = YAML.load_file('factories/users.yaml')
    user = users["tom"]
    username = user[0]["username"]
    password = user[1]["password"]
    expect(username).to eq("tomservo")
    expect(password).to eq("pumaMan2")

    #visit site and log in
    visit 'https://www.simple.com/signin'
    current_url.should == 'https://www.simple.com/signin'
    within("#signin") do
      fill_in 'login_username', :with => username
      fill_in 'login_password', :with => password
    end
    click_button 'Sign in...'
    expect(page).to have_content 'Your username and passphrase don\'t match'
  end

  #it "logs in with good credentials", :js => true do
    #visit 'https://www.simple.com/signin'
    #within("#signin") do
      #fill_in 'login_username', :with => 'tomservo'
      #fill_in 'login_password', :with => 'pumaMan2'
    #end
    #click_button 'Sign in...'
    #expect(page).to have_content 'Richard Manriquez'
  #end
end
