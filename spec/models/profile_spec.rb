require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  before { @profile = user.build_profile(nickname: "TestUser",
                                         firstname: "Test",
                                         lastname: "Testman",
                                         country: "US",
                                         use_gravatar: true) }
  subject { @profile }

  it { should respond_to(:nickname) }
  it { should respond_to(:firstname) }
  it { should respond_to(:lastname) }
  it { should respond_to(:country) }
  it { should respond_to(:use_gravatar) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @profile.user_id = nil}
    it { should_not be_valid }
  end

  describe "when nickname is not present" do
    before { @profile.nickname = nil }
    it { should_not be_valid}
  end

  describe "when nickname length more than 50 chars" do
    before { @profile.nickname = "A"*51 }
    it { should_not be_valid}
  end

  describe "when firstname length more than 50 chars" do
    before { @profile.firstname = "A"*51 }
    it { should_not be_valid}
  end

  describe "when lastname length more than 50 chars" do
    before { @profile.lastname = "A"*51 }
    it { should_not be_valid}
  end

  describe "when country length more than 50 chars" do
    before { @profile.country = "A"*51 }
    it { should_not be_valid}
  end
end
