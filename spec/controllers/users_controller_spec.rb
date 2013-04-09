require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    it "devrait reussir" do
      get 'new'
      response.should be_success
    end

    describe "GET 'show'" do

      before(:each) do
        @user = Factory(:user)
      end

      it "devrait réussir" do
        get :show, :id => @user
        response.should be_success
      end

      it "devrait trouver le bon utilisateur" do
        get :show, :id => @user
        assigns(:user).should == @user
      end
    end

    it "devrait avoir le bon titre" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.nom)
    end

    it "devrait inclure le nom de l'utilisateur" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.nom)
    end

    it "devrait avoir une image de profil" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end

  end

  describe "LayoutLinks" do
    it "devrait avoir une page d'inscription a '/signup'" do
      get '/signup'
      response.should have_selector('title', :content => "Inscription")
    end

    it "devrait avoir le bon lien sur le layout" do
      visit root_path
      click "A propos"
      response.should have_selector('title', :content => "A propos")
      click_link "Aide"
      response.should have_selector('title', :content => "Aide")
      click_link "Contact"
      response.should have_selector('title', :content => "Contact")
      click_link "Accueil"
      response.should have_selector('title', :content => "Accueil")
      click_link "S'inscrire !"
      response.should have_selector('title', :content => "S'inscrire !")
    end
  end
end