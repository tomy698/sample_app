require 'spec_helper'

describe "Users" do

  describe "une inscription" do

    describe "ratée" do

      it "ne devrait pas créer un nouvel utilisateur" do
        visit signup_path
        fill_in "Nom",          :with => ""
        fill_in "Email",        :with => ""
        fill_in "Mot de passe",     :with => ""
        fill_in "Confirmation mot de passe", :with => ""
        click_button
        response.should render_template('users/new')
        response.should have_selector("div#error_explanation")
      end

      it "devrait créer un nouvel utilisateurr" do
        lambda do
          visit signup_path
          fill_in "Nom", :with => "Example User"
          fill_in "eMail", :with => "user@example.com"
          fill_in "Mot de passe", :with => "foobar"
          fill_in "Confirmation mot de passe", :with => "foobar"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "Bienvenue")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end
  end
end