require 'rails_helper'
RSpec.describe Api::V1::ElectionsController do
  describe "GET #index" do
    before do
      group = FactoryGirl.create(:group)
      FactoryGirl.create(:election, group: group)
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.length).to equal(1)
    end
  end

  describe "POST #create" do
    it "should create election and return election data in json format." do
      group = FactoryGirl.create(:group)
      post :create, :params => { election: FactoryGirl.build(:election, group: group).as_json }
      expect(response).to have_http_status(:created)
    end
  end
end