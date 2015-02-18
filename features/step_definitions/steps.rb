Given(/^I open the "(.*?)" browser$/) do |browser|
  @browser_opened = Watir::Browser.new to_browser_id(browser)
end

Then(/^the "(.*?)" browser is open$/) do |browser|
  fail ("The #{browser} browser is not open.") unless to_browser_id(browser).to_sym == @browser_opened.name
end

#Convert user names for browser to strings for watir-webdriver
def to_browser_id (browser)
  case browser.downcase
    when 'internet explorer', 'ie'
      'internet explorer'
    when /phantom/
      'phantomjs'
    else
      browser.downcase!.nil? ? browser : browser.downcase!
  end
end


#Card 2*************************************

Given(/^I am on the USA.gov site$/) do

  #browser = Watir::Browser.new #creates browser object instance
  BROWSER.goto ('USA.gov')

end


#Card3**************************************************************


Given(/^I go to USA.gov site$/) do
  BROWSER.goto ('USA.gov')
end