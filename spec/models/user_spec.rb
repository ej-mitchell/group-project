require "rails_helper"

RSpec.describe "User" do
  context "setting up user" do
    let(:user) { User.new(username: "Username", first_name: "Eliza", last_name: "Park", email: "swbrooks87@gmail.com", password: "Bob_Saget")}
    it "should have username, first name, last name" do
      expect(user.first_name).to be("Eliza")
      expect(user.last_name).to be("Park")
      expect(user.username).to be("Username")
    end
    it "should have an email" do
      expect(user.email).to be("swbrooks87@gmail.com")
    end
    it "should have a password with special characters" do
      expect(user.password).to be("Bob_Saget")
    end
  end
end
