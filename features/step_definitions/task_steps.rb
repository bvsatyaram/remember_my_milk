When(/^I enter "(.*?)" in task input$/) do |txt|
  within("#task_form") do
    fill_in 'task[title]', :with => txt
  end
end

Then(/^I should see "(.*?)" in tasks list$/) do |txt|
  expect(page.first('#tasks').text).to match(txt)
end