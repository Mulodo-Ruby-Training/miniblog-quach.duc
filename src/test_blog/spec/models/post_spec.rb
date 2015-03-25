# encoding: utf-8
require './spec/spec_base_helper.rb'

RSpec.describe Post, type: :model do
  describe 'Create/edit/delete post' do
      # Test function create post in model
      # desc: count and compare number of all post
      it "when create post" do
        find_and_destroy("Post",FactoryGirl.attributes_for(:post_1st)[:id])
        @posts_count = Post.all.count
        @post = Post.create(FactoryGirl.attributes_for(:post_1st))
        expect(@posts_count).to eq(Post.all.count - 1)
      end

      it "when update post" do
        # Destroy post_2nt if exist
        find_and_destroy("Post",FactoryGirl.attributes_for(:post_2nd)[:id])
        @post = Post.update(Post.first[:id], FactoryGirl.attributes_for(:post_2nd))
        expect(@post).to be_valid
      end

  end

  describe 'Check validation post' do
      # TODO: view bofore(:example), bofore(:context),...
      before do
        @post = Post.create(FactoryGirl.attributes_for(:post_1st))
      end

      context "check content" do
        it "when a content is not present" do
          @post.content = nil
          expect(@post).to be_invalid
        end
      end

      context "check title" do
        it "when a title is not present" do
          @post.title = nil
          expect(@post).to be_invalid
        end
      end

  end

  # TODO
  # describe "Upload image for post" do
  # end
end