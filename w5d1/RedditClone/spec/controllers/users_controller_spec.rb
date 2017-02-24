require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject(:user) do
    FactoryGirl.build(:user,
      username: "xose",
      password: "gobelek")
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post :create, user: { password: "gobelek" }
        expect(response).to render_template(:new)
      end

      it "validates that the password is at least 6 characters long" do
        post :create, user: { username: "xose", password: "qisa" }
        expect(response).to render_template(:new)
      end
    end

    context "with valid params" do
      it "redirects user to links index on success" do
        post :create, user: { username: "xose", password: "gobelek" }
        expect(response).to redirect_to(user_url(User.find_by_username("xose")))
      end
    end
  end

end
