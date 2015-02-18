When(/^I fill in "(.*?)" with "(.*?)"$/) do |selector, txt|
  fill_in selector, with: txt
end

Then(/^I should see "([^\"]*?)"$/) do |txt|
  expect(page).to have_content txt
end

Then(/^I should see "(.*?)" within "(.*?)"$/) do |txt, selector|
  within selector do
    expect(page).to have_content txt
  end
end


Then(/^I should not see "(.*?)"$/) do |txt|
  expect(page).not_to have_content txt
end

When(/^I press "([^\"]*?)"$/) do |btn|
  click_link_or_button btn
end

When(/^I press "(.*?)" in "(.*?)"$/) do |txt, selector|
  within selector do
    click_link_or_button txt
  end
end

When(/^I follow the link "(.*?)" in the last email sent to "(.*?)"$/) do |link_text, email|
  open_email(email)
  current_email.click_link link_text
end

Given(/^that a user with email "(.*?)" and password "(.*?)" exist$/) do |email, password|
  usr = User.find_or_create_by(email: email) do |user|
    user.password = password
    user.password_confirmation= password
  end
  usr.confirm!
end

Given(/^I log in as "(.*?)"$/) do |email|
  step "that a user with email \"#{email}\" and password \"rahasyam\" exist"
  step 'I am in home page'
  step "I fill in \"user[email]\" with \"#{email}\""
  step 'I fill in "user[password]" with "rahasyam"'
  step 'I press "Login" in "form"'
end

Given(/^I am logged in$/) do
  step 'I log in as "user@example.com"'
end

Then(/I debug/) do
  debugger
end
