require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "LogIn" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://www.simple.com/signin"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_log_in" do
    @driver.get(@base_url + "/")
    #@driver.find_element(:link, "Sign In").click
    @driver.find_element(:id, "login_username").clear
    @driver.find_element(:id, "login_username").send_keys "tomservo"
    @driver.find_element(:id, "login_password").clear
    @driver.find_element(:id, "login_password").send_keys "pumaMan2"
    @driver.find_element(:id, "signin-btn").click
    element_present?(:css, "p:contains('Your username and passphrase don\'t match')").should be_true
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert.text
  ensure
    @accept_next_alert = true
  end
end

