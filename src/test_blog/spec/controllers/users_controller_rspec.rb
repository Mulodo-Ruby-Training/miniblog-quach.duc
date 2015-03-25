# encoding : utf-8

RSpec.describe UsersController, :type => :controller do

  describe "When we call active new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "When we call active show" do
    it "returns http success" do
      get :show, id:User.first[:id]
      expect(response).to have_http_status(:success)
    end
  end

end