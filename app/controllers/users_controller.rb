class UsersController < ApplicationController

  def new
  end

  def create
    # use the following instantiation if you don't use the key name inside brackets in the HTML form
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    
    # @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # because we cannot pass in a hash directly to #create for security reasons we pass in this private method
  # that validates the hash data being passed in i.e., it requires the User hash with respective nested hash keys
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
