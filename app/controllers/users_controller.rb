class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new show create)
  before_action :load_user, except: %i(new index create)
  before_action :correct_user, only: %i(edit update)

  def index
    @users = User.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def new
    @user = User.new
  end

  def show
    return @user if @user = User.find_by(id: params[:id])
    flash[:danger] = t "errors.user_not_found"
    redirect_to root_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = t "greeting"
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :avatar
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "errors.please_login"
    redirect_to login_path
  end

  def correct_user
    redirect_to root_path unless current_user? @user
  end

  def load_user
    return @user if @user = User.find_by(id: params[:id])
    flash.now[:danger] = t "errors.user_not_found"
    redirect_to root_path
  end
end
