require "rails_helper"

RSpec.describe "Genre" do
  context "setting up genre" do
    let(:genre) { Genre.new(name: "Mystery")}
    it "should have name" do
      expect(genre.name).to be("Mystery")
    end
  end
end
