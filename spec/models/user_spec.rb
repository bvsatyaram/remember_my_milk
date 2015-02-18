require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  it "has many tasks" do
    expect(subject.tasks.to_a).to be_blank
    t1 = subject.tasks.create
    expect(subject.tasks.to_a).to eq([t1])
    t2 = subject.tasks.create
    expect(subject.tasks.to_a).to eq([t1, t2])
  end
end
