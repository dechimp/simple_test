require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "ViewAndroid" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://www.simple.com"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "views_android" do
    @driver.get(@base_url + "/")

    # store the image element into a variable
    image_element = @driver.find_element(:css, ".iphone-first-screenshot")

    # verify that iphone is selected by default
    #verify { image_element.css_value('background-image').should =~ /^[\s\S]*iphone[\s\S]*$/}
    raise "I don't believe 'iphone' is selected by default" unless image_element.css_value('background-image').include?("iphone") 

    # click the android icon
    @driver.find_element(:css, "li.android").click

    # verify that android is now selected 
    raise "I don't believe an 'android' image is selected" unless image_element.css_value('background-image').include?("android")
  end
  
  #def element_present?(text)
    #@driver.is_text_present(text)
    #true
  #rescue Selenium::WebDriver::Error::NoSuchElementError
    #false
  #end
  
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

