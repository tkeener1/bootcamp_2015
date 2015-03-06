Then /^I see a search field$/ do
  expect(@current_page.search).to be_visible
end

Then /^the search field value is "([^"]*)"$/ do |search_string|
  expect(@current_page.search_value).to eq(search_string)
end

Then /^I see a search button$/ do
  expect(@current_page.submit).to be_present
end

Then /^the search button label is "([^"]*)"$/ do |button_label|
  #actual =  BROWSER.button(:id => "buscarSubmit").text
  expect(@current_page.submit_label).to eq(button_label)
end

When(/^I submit a search "(.*?)"$/) do |search_string|
  #BROWSER.text_field(:id => "query").set search_string
  #BROWSER.button(:id => "buscarSubmit").click

  @current_page.submit_search search_string

end

Then(/^I see "(.*?)" search result\(s\)$/) do |expected_count|
# parse expected count
  parse_count = expected_count.to_s.match(/(\d*)([a-z|A-Z ]*)(\d*)/)
  compare_to = parse_count[2].strip
  count = parse_count[1] == '' ? parse_count[3].to_i : parse_count[1].to_i

# get the number of results
  result_count = @current_page.results_count

# determine if step passes
  comparison = HelperMethods.compare(compare_to, count, result_count)

  expect(comparison).to be_truthy
end

Then(/^a message is displayed that contains "([^"]*)"$/) do |message|
  actual = @current_page.message

  expect(actual).to include(message)

end

Then /^I see the search term truncated to (\d+) characters$/ do |character_number|
  expected = character_number.to_i
  # get search string from edit field
  actual = @current_page.search_value.size
  expect(actual).to eq(expected)
end
