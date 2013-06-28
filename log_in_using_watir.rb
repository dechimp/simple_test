require "watir-webdriver"
require "yaml"

def get_browser_instance
   @browser = Watir::Browser.new :ff
end

def get_user_info
   user_data = YAML.load_file('./spec/factories/users.YAML')

   #test the user data
   begin
      tom = user_data["tom"]
      @username = tom[0]["username"]
      @password = tom[1]["password"]
      #puts tom.inspect
      #if @toms_credentials["username"] != "servo"
         #raise 'error: user data test failed'
      #end
   end
end

def log_in
  # open the sign in page
   puts 'opening web page...'
   @browser.goto "http://www.simple.com/signin"
   #@browser.a(:text => "Sign In").click

   # log in with bad credentials
   @browser.text_field(:id => "login_username").set @username
   @browser.text_field(:id => "login_password").set @password
   @browser.button(:id => "signin-btn").click

   # verify that you are getting the correct login message

   @browser.close
   puts 'tests complete'
end

get_user_info
get_browser_instance
log_in
