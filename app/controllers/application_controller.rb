# encoding: utf-8

class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery
  include SessionsHelper

  def set_locale
    I18n.locale = session[:locale] || :fr
  end
end
