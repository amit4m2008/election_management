require 'spec_helper'

describe 'dashboard/index.html.erb' do
  it 'displays election index' do
    group = FactoryGirl.create(:group)
    election1 = FactoryGirl.create(:election, group: group)
    election2 = FactoryGirl.create(:election, group: group)
    assign(:elections, [election1, election2])
    render

    expect(rendered).to match(/Elections/)
  end
end