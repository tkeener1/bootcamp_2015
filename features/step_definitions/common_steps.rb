Given /^I am on the "(.*?)" page$/ do |page|

  page_name = page.downcase.titleize.gsub(' ','') + "Page"  #Must = UsaHomePage module

  #alternate #page_name = page.downcase.split(' ').map {|word| word.capitalize}.join + "Page"

  @current_page = eval(page_name).new  #used to create a class name from the string pagename

  @current_page.visit  #pulling from usahomepage module



end



