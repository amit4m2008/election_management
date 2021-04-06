require 'rails_helper'
RSpec.describe Api::V1::UsersController do
  describe "GET #index" do
    before do
      FactoryGirl.create(:user)
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
    it "should create user and return user data in json format." do
      body_params = FactoryGirl.build(:user).as_json.merge(group_id: FactoryGirl.create(:group).id)
      post :create, :params => { user: body_params }
      expect(response).to have_http_status(:created)
    end
  end
end