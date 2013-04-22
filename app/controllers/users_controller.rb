# encoding: utf-8

class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  #before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  def new
    @user = User.new
    @titre = I18n.t("buttons.signup")
  end

  def index
    @titre = I18n.t("fields.allusers")
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @titre = @user.nom
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = I18n.t("fields.welcomemessage")
      redirect_to @user
    else
      @titre = I18n.t("buttons.signup")
      render 'new'
    end
  end

  def edit
    @titre = I18n.t("fields.settings")
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = I18n.t("text.profilupdated")
      redirect_to @user
    else
      @titre = I18n.t("fields.settings")
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = I18n.t("text.userdeleted")
    redirect_to users_path
  end

  def following
    @titre = I18n.t("text.following")
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers
    @titre = I18n.t("text.follower")
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end

  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
