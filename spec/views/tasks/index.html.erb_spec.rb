require 'rails_helper'

RSpec.describe "tasks/index.html.erb", type: :view do
  before(:each) do
    assign(:new_task, Task.new)
    assign(:tasks, [])
  end

  it "should have 'My Tasks'" do
    render

    expect(rendered).to match("My Tasks")
  end
end
