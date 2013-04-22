# encoding: utf-8

class RelationshipsController < ApplicationController
    before_filter :authenticate

    def create
      I18n.locale = :en
      session[:locale] = I18n.locale
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    end

    def destroy
      I18n.locale = :fr
      session[:locale] = I18n.locale
      @user = Relationship.find(params[:id]).followed
      current_user.unfollow!(@user)
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    end
end