require 'rails_helper'
RSpec.describe Api::V1::GroupsController do
  describe "GET #index" do
    before do
      FactoryGirl.create(:group)
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
    it "should create group and return group data in json format." do
      post :create, :params => { group: FactoryGirl.build(:group).as_json }
      expect(response).to have_http_status(:created)
    end
  end
end