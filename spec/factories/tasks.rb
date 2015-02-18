FactoryGirl.define do
  sequence :title do |n|
    "Task ##{n}"
  end

  factory :task do
    title
    user
  end

end
