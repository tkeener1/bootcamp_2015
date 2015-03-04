Given(/^I open the "(.*?)" browser$/) do |browser|
  @browser_opened = Watir::Browser.new HelperMethods.to_browser_id(browser)
end

Then(/^the "(.*?)" browser is open$/) do |browser|
  browser_name = @browser_opened.name
  @browser_opened.close
  expect(browser_name).to eq(HelperMethods.to_browser_id(browser))
end
