class SessionsController < ApplicationController
  def new
  end
  def create
    authorized = User.authenticate(params[:login], params[:password])
    if authorized
      user = User.where(:login => params[:login]).first_or_create(:login => params[:login])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid login or password"
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => t(:signed_out)
  end
end
