require "rails_helper"

RSpec.describe Notifier, type: :mailer do
  let(:user) { FactoryGirl.create(:user) }

  before { @post = user.posts.build(title: "Test post",
                                    content: "Some text. "*100)
           @post.save
           @comment = @post.comments.build(nickname: "Jose",
                                     content: "This is a comment",
                                     email: "jose@test.com")
           @mail = Notifier.commented(@comment)
         }

  subject { @mail }

  describe "commented" do

    describe "renders the headers" do
      it { expect(@mail.subject).to eq("[Blog] Your post Test post was commented") }
      it { expect(@mail.to).to eq([user.email]) }
    end

    it { expect(@mail.body.encoded).to match('Your post "Test post" was commented by Jose at') }
  end

end
