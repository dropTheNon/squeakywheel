class UserController < ApplicationController
  before_action :is_authenticated, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = 'User Created!'
    else
      flash[:danger] = user.errors.messages
      redirect_to signup_path
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if (params[:user][:screenshot])
      uploaded_file = params[:user][:screenshot].path
      cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)
      params[:user][:screenshot] = cloudinary_file['public_id']
    end
    t = User.find(params[:id])
    t.update(user_params)
    flash[:success] = 'User Profile Updated!'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :screenshot)
  end
end
