# encoding : utf-8

RSpec.describe SessionsController, :type => :controller do

  describe "When we call active new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "When we call active create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  # describe "When we call active destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end


end