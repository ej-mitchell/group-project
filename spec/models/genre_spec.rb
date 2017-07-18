require "rails_helper"

describe Genre do
  it { should have_valid(:name).when('name') }

  it { should_not have_valid(:name).when(nil, '')}
end

RSpec.describe "Genre" do
  context "setting up genre" do
    let(:genre) { Genre.new(name: "Mystery")}
    it "should have name" do
      expect(genre.name).to include("Mystery")
    end
  end
end
