require 'rails_helper'
RSpec.describe Api::V1::VotesController do
  describe "GET #index" do
    before do
      group = FactoryGirl.create(:group)
      user = FactoryGirl.create(:user)
      election = FactoryGirl.create(:election, group: group)
      FactoryGirl.create(:vote, election: election, user: user)
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
    it "should create vote and return vote data in json format." do
      group = FactoryGirl.create(:group)
      user = FactoryGirl.create(:user)
      election = FactoryGirl.create(:election, group: group)
      post :create, :params => { vote: FactoryGirl.build(:vote, election: election, user: user).as_json }
      expect(response).to have_http_status(:created)
    end
  end
end