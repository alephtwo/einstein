# Users Controller
class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]
  before_filter :restrict_to_users

  def index
    @users = User.all
  end

  def show
    @clients = @user.clients.active
  end

  def disperse
    if User.all.size == 1
      flash[:error] = 'Cannot delete the last user.'
      redirect_to users_path
    elsif @user == current_user
      flash[:error] = 'You can\'t delete yourself.'
      redirect_to users_path
    else
      @migratables = User.where.not(id: @user.id)
    end
  end

  def migrate
    if User.all.size == 1
      flash[:error] = 'The last user can\'t be deleted.'
    else
      @user.clients.each_with_index do |client, i|
        client.update(user_id: user_users[i])
      end

      maint = current_user.maintenances.build
      maint.deleted_user = @user.email
      maint.save

      @user.destroy
      flash[:succes] = 'User deleted and clients moved successfully.'
    end
    redirect_to users_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User created successfully.'
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

  def user_params
    params
      .require(:user)
      .permit(
        :username,
        :password,
        :password_confirmation,
        :email,
        :first_name,
        :last_name
      )
  end

  def user_users
    params.require(:users)
  end
end
