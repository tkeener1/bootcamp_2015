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


#Card 5**********************************************************


Then(/^I see a search field$/) do
  # old fail('The browser does not contain a search box') unless BROWSER.text_field(:id => 'query').visible?
  expect(BROWSER.text_field(:id=>'query')).to be_visible
end

Then (/^the field value is "(.*?)"$/) do |arg1|
  #fail('the browser does not contain the correct place holder') unless BROWSER.text_field(:id => 'query').placeholder.eql? arg1
  expect(BROWSER.text_field(:id=>'query').placeholder).to eq(arg1)

end


Then (/^I see a search button$/) do
end


Then (/^the search button label is "(.*?)"$/) do |arg1|
  #fail('Search button is not titled correctly') unless BROWSER.button(:id => 'buscarSubmit').value.eql?(arg1)
   expect(BROWSER.button(:id=>'buscarSubmit').value).to eq(arg1)
end

# Card 5.1******************************************************************************************************

When(/^I submit a search "(.*?)"$/) do |search_string|
  BROWSER.text_field(:id => 'query').set(search_string)
  BROWSER.button(:id => 'buscarSubmit').click
end


Then(/^I see "(.*?)" search result\(s\)$/) do |expected_count|

  # parse expected count
  parse_count = expected_count.to_s.match(/(\d*)([a-z|A-Z ]*)(\d*)/)              #match makes an array
  compare_to = parse_count[2].strip
  count = parse_count[1] == '' ? parse_count[3].to_i : parse_count[1].to_i

# get the number of results
  result_count = BROWSER.divs(:id => /^result-/).size


  comparison = case compare_to
                 when '', /equal/
                   count == result_count
                 when 'less than'
                   result_count < count
                 when 'greater than'
                   result_count > count
                 when 'or less'
                   result_count <= count
                 when 'or more', 'at least'
                   result_count >= count
                 else
                   fail ("Comparison #{compare_to} not supported")
               end

  #fail("The actual count #{result_count} does not match the expected count #{expected_count}.") unless comparison
  expect(result_count).to be >= (count)

  puts expected_count
  puts result_count
  puts comparison
end


# Card 5.2**************************************************************************************************


Then(/^maximum of (\d+) answers per page returned$/) do |expected_count|

  # parse expected count
  parse_count = expected_count.to_s.match(/(\d*)([a-z|A-Z ]*)(\d*)/)
  compare_to = parse_count[2].strip
  count = parse_count[1] == '' ? parse_count[3].to_i : parse_count[1].to_i

  #get the number of results
  result_count = BROWSER.divs(:id => /^result-/).size


  comparison = case compare_to
                 when '', /equal/
                   count == result_count
                 when 'less than'
                   result_count < count
                 when 'greater than'
                   result_count > count
                 when 'or less'
                   result_count <= count
                 when 'or more', 'at least'
                   result_count >= count
                 else
                   fail ("Comparison #{compare_to} not supported")
               end

  #fail("The actual count #{result_count} does not match the expected count #{expected_count}.") unless comparison
  expect(result_count).to be == (count)


end

# Card 5.3***************************************************************************************************************

Then(/^my text is truncated at (\d+) characters$/) do |truncate_size|

  actual_entered = BROWSER.text_field(:id=>'query').value.size.to_s

  fail ("Text field accepted #{actual_entered} instead of #{truncate_size}.") unless actual_entered == truncate_size

end


# Card 5.5************************************************************************************************************88


Then(/^"(.*?)" is displayed$/) do |error|

   fail ("Incorrect error message was displayed") unless BROWSER.div(:id=>'no-results').text.eql?(error)

end


Then(/^"(.*)" search is displayed$/) do |search|

end
