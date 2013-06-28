require "watir-webdriver"

$browser = Watir::Browser.new :ff

Given /^I am on the Simple sign in page$/ do
   puts 'opening web page...'
   $browser.goto "http://www.simple.com/signin"
end

When /^I sign in with username "(.*)"$/ do |item|
   $browser.text_field(:id => "login_username").set item
end

And /^I sign in with password "(.*)"$/ do |item|
   $browser.text_field(:id => "login_password").set item
   $browser.button(:id => "signin-btn").click
end

Then /^I should see the message "(.*)"$/ do |item|
  $browser.text.should include(item)
  $browser.close
end

