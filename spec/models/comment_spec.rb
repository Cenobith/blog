require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  before { @post = user.posts.build(title: "Test post",
                                    content: "Some text. "*100)
           @post.save
           @comment = @post.comments.build(nickname: "Jose",
                                  content: "This is a comment",
                                  email: "jose@test.com")
         }
  subject { @comment }

  it { should respond_to(:nickname) }
  it { should respond_to(:content) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when post_id is not present" do
    before { @comment.post_id = nil}
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @comment.content = nil }
    it { should_not be_valid }
  end

  describe "when nickname is not present" do
    before { @comment.nickname = nil }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @comment.email = nil }
    it { should_not be_valid }
  end

  describe "when email is not valid" do
    before { @comment.email = "feferferf"}
    it { should_not be_valid }
  end

  describe "when nickname length more than 100 chars" do
    before { @comment.nickname = "A"*101 }
    it { should_not be_valid}
  end
end
