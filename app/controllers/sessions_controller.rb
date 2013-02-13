class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    if User.count.zero?
    # no user exists: create default admin with supplied credentials
      User.create(name: params[:name], password: params[:password])
    end

    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_path
    else
      redirect_to login_path, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_path, notice: "Logged out"
  end
end
