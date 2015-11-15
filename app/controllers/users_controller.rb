class UsersController < ApplicationController
  def home
    @user = User.new
  end

  def sign_up
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to profile_path(@user.name)
    else
      render :home
    end

  end

  def sign_in
    user = User.find_by(:email =>params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to profile_path(user.name)
    end
    # render(:text => "Falta un template :)")
  end
  def profile
    # render(:text => params[:name])
    @user = User.find_by_name(params[:name])
    @posts = @user.posts.paginate(page: params[:page])
  end

  def sign_out
    log_out
    redirect_to home_url
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
