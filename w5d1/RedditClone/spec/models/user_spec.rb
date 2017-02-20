require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    FactoryGirl.build(:user,
      username: "xose",
      password: "gobelek")
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

    it { should have_many(:subs) }
    it { should have_many(:user_votes) }
    it { should have_many(:comments) }
  end

  describe "#is_password?" do
    it "checks to see if given password matches password_digest" do
      expect(user.is_password?("gobelek")).to be true
    end
  end

  describe "#reset_session_token" do
    it "changes user's session token" do
      user.reset_session_token!
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns this new session token" do
      session_token = user.reset_session_token!

      expect(user.session_token).to eq(session_token)
    end
  end

  describe "::find_by_credentials" do
    before { user.save }

    it "returns the user if found" do
      expect(User.find_by_credentials("xose", "gobelek")).to eq(user)
    end

    it "returns nil if user doesn't exist" do
      expect(User.find_by_credentials("deyirman", "abdmalik")).to eq(nil)
    end
  end

end
