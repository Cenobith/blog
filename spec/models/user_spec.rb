require 'rails_helper'

RSpec.describe User, :type => :model do
  before { @user = User.new(email: "user@example.com",
                            password: "testtest", password_confirmation: "testtest") }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid}
  it { should_not be_admin}

  describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end

end

