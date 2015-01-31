class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy, :disperse, :migrate]
  before_filter :check_user

  def index
    @users = User.all
    @mobile_users = User.all.page params[:page]
  end

  def show 
    @clients = @user.clients.active
    @mobile_clients = @user.clients.active.page params[:page]
  end

  def disperse
    if User.all.size == 1
      flash[:error] = "Cannot delete the last user. Please contact your system administrator."
      redirect_to users_path
    else 
      @migratables = User.where.not(id: @user.id)
    end
  end

  def migrate
    if User.all.size == 1
      flash[:error] = "The last user can't be deleted. Please contact your system administrator."
    else 
      @user.clients.each_with_index do | client, i | 
        client.update(user_id: user_users[i])
      end

      maint = current_user.maintenances.build
      maint.deleted_user = @user.email
      maint.save

      @user.destroy
      flash[:succes] = "User deleted and clients moved successfully."
    end
    redirect_to users_path
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
        flash[:error] = "You do not have access to that page."
        redirect_to root_path
      end
    end

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email, :first_name, :last_name)
    end

    def user_users
      params.require(:users)
    end

end
