# encoding: utf-8
require './spec/spec_base_helper.rb'

RSpec.describe Comment, type: :model do
  describe 'Create/edit/delete comment' do
      # define user_1st, user_2nd to use
      let(:comment_1st) { FactoryGirl.attributes_for(:comment_1st) }
      let(:comment_2nd) { FactoryGirl.attributes_for(:comment_2nd) }

      # Test function create comment in model
      # desc: count and compare number of all comment
      it "when create comment" do
        # find_and_destroy("Comment",comment_1st[:id])
        @comments_count = Comment.all.count
        @comment = Comment.create(comment_1st)
        expect(@comment).to be_valid
      end

      it "when update post" do
        Comment.create(comment_1st)
        # Destroy post_2nt if exist
        # find_and_destroy("Comment",comment_2nd[:id])
        @comment = Comment.update(Comment.first[:id], comment_2nd)
        expect(@comment).to be_valid
      end

  end
end