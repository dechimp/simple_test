What is this?
============
'Simple Test' is a project for learning first-hand the 
similarities/differences 
between the different web-based testing frameworks, such as 
Selenium, Capybara, RSpec, Cucumber and Google's Robot Framework.  

The tests perform basic automated webpage tests such as signing in, and verifying elements on the 
page.

Dependencies
===========
(both) Ruby 1.9.2 and 1.9.3 As always, run `ruby -v` to see which version of Ruby you are using.  You may also use RVM to (easily) switch between versions of Ruby.  Info on RVM can be found [here](https://rvm.io/). A cheat sheet of RVM commands can be found on the [RVM cheat sheet](http://cheat.errtheblog.com/s/rvm).

Gems: rspec, selenium, capybara, watir, cucumber

Install
=======
There is no install.  Just clone the repo and run the scripts from the shell (directions below).

Running the tests
================

## Selenium + RSpec
  From the root project directory, run 
  `$ rspec log_in_using_selenium.rb`

## Capybara + RSpec
  Change to the /spec/ directory
  `$ cd spec`
  then run the rspec test
  `$ rspec log_in.rb`

## Watir
  From the root project directory, run
  `$ ruby log_in_using_watir.rb`

## Watir + Cucucmber
  For this project, Cucumber requires Ruby 1.9.2.  With RVM, you can 
  switch to 1.9.2 by running
  `$ rvm use ruby-1.9.2`

  Now for the test. From the root project directory, simply run
  `$ cucumber features`

## Robot Framework
