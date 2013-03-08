require 'spec_helper'

describe "todos/index" do
  before(:each) do
    assign(:todos, [
      stub_model(Todo,
        :task => "Task",
        :completed => false
      ),
      stub_model(Todo,
        :task => "Task",
        :completed => false
      )
    ])
  end

  it "renders a list of todos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Task".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
