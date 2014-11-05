class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :check_user

  def index
    @users = User.all
  end

  def show 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created successfully."
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Successfully updated #{@user.email}."
      redirect_to clients_path
    else
      render 'edit'
    end
  end

  def destroy 
    @user.destroy
    redirect_to users_path
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def check_user
      unless user_signed_in?
        flash[:alert] = "You do not have access to that page."
        redirect_to root_path
      end
    end

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email, :first_name, :middle_name, :last_name)
    end

end
