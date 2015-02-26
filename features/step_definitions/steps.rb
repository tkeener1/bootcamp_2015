Given(/^I open the "(.*?)" browser$/) do |browser|
  @browser_opened = Watir::Browser.new HelperMethods.to_browser_id(browser)
end

Then(/^the "(.*?)" browser is open$/) do |browser|
  fail ("The #{browser} browser is not open.") unless HelperMethods.to_browser_id(browser) == @browser_opened.name
  @browser_opened.close
end

Given /^I am on the USA.gov home page$/ do
  BROWSER.goto 'www.usa.gov'
end

#Card 5**********************************************************


Then(/^I see a search field$/) do
  # old fail('The browser does not contain a search box') unless BROWSER.text_field(:id => 'query').visible?
  expect(BROWSER.text_field(:id => 'query')).to be_visible
end

Then (/^the field value is "(.*?)"$/) do |arg1|
  #fail('the browser does not contain the correct place holder') unless BROWSER.text_field(:id => 'query').placeholder.eql? arg1
  expect(BROWSER.text_field(:id => 'query').placeholder).to eq(arg1)

end


Then (/^I see a search button$/) do
end


Then (/^the search button label is "(.*?)"$/) do |arg1|
  #fail('Search button is not titled correctly') unless BROWSER.button(:id => 'buscarSubmit').value.eql?(arg1)
  expect(BROWSER.button(:id => 'buscarSubmit').value).to eq(arg1)
end

# Card 5.1******************************************************************************************************

When(/^I submit a search "(.*?)"$/) do |search_string|
  BROWSER.text_field(:id => 'query').set(search_string)
  BROWSER.button(:id => 'buscarSubmit').click
end


Then(/^I see "(.*?)" search result\(s\)$/) do |expected_count|

  # parse expected count
  parse_count = expected_count.to_s.match(/(\d*)([a-z|A-Z ]*)(\d*)/) #match makes an array
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
  puts parse_count
end


# Card 5.3***************************************************************************************************************


Then(/^my text is truncated at (\d+) characters$/) do |truncate_size|

  expect(actual_entered = BROWSER.text_field(:id => 'query').value.size.to_s).to eq(truncate_size)

  #fail ("Text field accepted #{actual_entered} instead of #{truncate_size}.") unless actual_entered == truncate_size

end


# Card 5.5************************************************************************************************************88


Then(/^"(.*?)" is displayed$/) do |error|

  #fail ("Incorrect error message was displayed") unless BROWSER.div(:id=>'no-results').text.eql?(error)
  expect(BROWSER.div(:id => 'no-results').text).to eq(error)
end

# Card 9****************************************************************************************
#collect = BROWSER.as(:class=>'summary_link')
#collect.each do |this|
#  puts this.text
#end


Then(/^there will be a box named "(.*?)"$/) do |box_name|
  expect(BROWSER.div(:class => 'hpboxcontainer').text).to include(box_name)

end


Then(/^I see a contents section$/) do
  expect(BROWSER.div(:class => 'hpboxcontainer')).to exist
end


Then(/^the box title contains the text "(.*?)"$/) do |content|
  expect(BROWSER.div(:class => 'hpboxcontainer').h2.text).to include content

end
When(/^there is a link for each page section$/) do
  sections=[]
  section_links=[]

  BROWSER.div(:class => 'hpboxcontainer').links.each do |item|
    link_text = item.text.downcase
    link_text.gsub!('from usa.gov', '1').strip if link_text=~/e-mail/
    section_links<<link_text
  end

  BROWSER.divs(:class => /.*container/).each { |section| sections.push(section.h3.text.downcase) if section.h3.exist? }
  #sections.push(BROWSER.div(:id=>'featureInfo').h2.text.downcase)

  #expected(section_links).to match_array(sections.sort)
  puts sections
  puts section_links
end

#Card 11******************************************************************************


When(/^I click the "(.*)" link$/) do |search|

  if search == 'Savings Bonds Calculator'
    BROWSER.div(:id => 'icon1').click
  else
    BROWSER.link(:text => /#{search}/).click
  end
end


Then(/^I am on the "(.*)" Calculator page$/) do |string|
  expect(BROWSER.title).to include string
end

