require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    response.should have_selector("title",
                                  :content => "Simple App du Tutoriel Ruby on Rails")
  end

  describe "GET 'home'" do

    describe "quand pas identifié" do

      before(:each) do
        get :home
      end

      it "devrait réussir" do
        response.should be_success
      end

      it "devrait avoir le bon titre" do
        response.should have_selector("title",
                                      :content => "#{@base_titre} | Home")
      end
    end

    describe "quand identifié" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        other_user = Factory(:user, :email => Factory.next(:email))
        other_user.follow!(@user)
      end

      it "devrait avoir le bon compte d'auteurs et de lecteurs" do
        get :home
        response.should have_selector("a", :href => following_user_path(@user),
                                      :content => "0 auteur suivi")
        response.should have_selector("a", :href => followers_user_path(@user),
                                      :content => "1 lecteur")
      end
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "doit avoir le bon titre contact" do
      get 'contact'
      response.should have_selector("title", :content => " | Contact")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

    it "doit avoir le bon titre a propos" do
      get 'about'
      response.should have_selector("title",
                                    :content => " | A propos")
    end
  end

  describe "GET 'help'" do
    it "si la page existe" do
      get 'help'
      response.should be_success
    end

    it "doit avoir le bon titre contact" do
      get 'help'
      response.should have_selector("title", :content => " | Aide")
    end
  end
end
