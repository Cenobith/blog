require 'rails_helper'

RSpec.describe Page, type: :model do
  before { @page = Page.new(title: "TestPage",
                               content: "<h2>Test</h2>") }

  subject { @page }

  it { should respond_to(:title) }
  it { should respond_to(:content) }

  it { should be_valid }

  describe "when title is not present" do
    before { @page.title = nil}
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @page.content = nil }
    it { should_not be_valid}
  end

  describe "when title length more than 20 chars" do
    before { @page.title = "A"*21 }
    it { should_not be_valid}
  end

end
