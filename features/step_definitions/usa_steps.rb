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
  expect(@current_page.submit_label).to eq(button_label)
end

When(/^I submit a search "(.*?)"$/) do |search_string|
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
  expect(@current_page.message).to include(message)
end

Then /^I see the search term truncated to (\d+) characters$/ do |character_number|
  expected = character_number.to_i
  # get search string from edit field
  actual = @current_page.search_value.size
  expect(actual).to eq(expected)
end

Then(/^I see a contents section$/) do
  expect(@current_page.content_box).to exist
end


Then(/^the section title contains the text "(.*?)"$/) do |content|
  expect(@current_page.content_box_title).to include content
end


Then(/^there is a link for each page section$/) do
  actual = @current_page.link_names.sort
  actual.collect! {|name| name.upcase}
  actual.collect! {|name| name=~/e-mail/i ? name.gsub!(' FROM USA.GOV', '') : name}

  expect(actual).to match_array(@current_page.section_titles.sort)
end


When(/^I click the content link "([^"]*)"$/) do |link_name|
  @current_page.click_content_link(link_name)
end


Then(/^the "([^"]*)" section is visible$/) do |expected|
  expected.gsub!(' ', '_')
  expected = 'eml-alrt' if expected =~ /e-mail/i

  expect(@current_page.current_url).to include(expected)
end

