# encoding : utf-8

RSpec.describe UsersController, :type => :controller do

  let(:user_1st) { FactoryGirl.attributes_for(:user_1st) }

  describe "When we call active new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "When we call active list_user" do
    it "returns http success" do
      get :user_index
      expect(response).to have_http_status(:success)
    end
  end

  describe "When we call active show" do
    before do
      User.create(user_1st)
    end
    it "returns http success" do
      get :show, id:User.first[:id]
      expect(response).to have_http_status(:success)
    end
  end

end