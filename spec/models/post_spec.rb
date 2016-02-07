require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  before { @post = user.posts.build(title: "Test post",
                                    content: "Some text. "*100) }
  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @post.user_id = nil}
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @post.title = nil }
    it { should_not be_valid}
  end

  describe "when title length more than 250 chars" do
    before { @post.title = "A"*251 }
    it { should_not be_valid}
  end
end
