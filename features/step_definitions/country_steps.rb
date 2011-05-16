Given /the following countries exist:/ do |countries|
  Country.destroy_all
  Country.create!(countries.hashes)
end

Given /^"([^"]*)" is visited$/ do |country|
  Given "I am on #{country}'s country page"
  And %{I press "Visit"}
end

Then /^I should see the following table:$/ do |expected_table|
  document = Nokogiri::HTML(page.body)
  rows = document.css('section>table>tr').collect { |row| row.xpath('.//th|td').collect {|cell| cell.text } }

  expected_table.diff!(rows)
end