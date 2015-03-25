# encoding : utf-8

RSpec.describe PostsController, :type => :controller do

  describe "When we call active index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "When we call active show" do
    it "returns http success" do
      get :show, id: Post.first[:id]
      expect(response).to have_http_status(:success)
    end
  end

  # describe "When we call active new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end


end