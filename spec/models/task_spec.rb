require 'rails_helper'

RSpec.describe Task, type: :model do
  subject {create(:task)}

  it "belongs to user" do
    expect(subject.user).to be_an_instance_of(User)
  end
end
