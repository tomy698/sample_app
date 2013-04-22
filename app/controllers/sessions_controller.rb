# encoding: utf-8

class SessionsController < ApplicationController
  def new
    @titre = I18n.t("buttons.signin")
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = I18n.t("error.badloginpassword")
      @titre = I18n.t("buttons.signin")
      render 'new'
    else
      sign_in user
      redirect_back_or user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end