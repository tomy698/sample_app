# encoding: utf-8

class PagesController < ApplicationController

  def home
    @titre = I18n.t("fields.home")
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def help
    @titre = I18n.t("fields.help")
  end
end
