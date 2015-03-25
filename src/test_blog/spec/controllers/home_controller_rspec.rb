# encoding : utf-8

RSpec.describe HomeController, :type => :controller do

  describe "When we call active index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "When we call active list_user" do
    it "returns http success" do
      get :user_index
      expect(response).to have_http_status(:success)
    end
  end

end