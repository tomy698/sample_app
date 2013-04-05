require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    response.should have_selector("title", :content => "Simple App du Tutoriel Ruby on Rails")
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "doit avoir le bon titre accueil" do
      get 'home'
      response.should have_selector("title",
                                    :content => " | Accueil")
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
