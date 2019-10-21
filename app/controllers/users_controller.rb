class UsersController < ApplicationController

  def create
    auth_hash = request.env["omniauth.auth"]
    user = User.find_by(uid: auth_hash[:uid], provider: "github")
    if user
      # user was found in db
      # log theem in to session
      flash[:success] = "Logged in as returning user #{user.name}"
    else
      # user not in DB, try to create new user
      # user = User.new(uid: auth_hash[:uid], provider: "github", name: auth_hash[:info][:name], email: auth_hash[:info][:email] )
      user = User.build_from_github(auth_hash)
      if user.save
        flash[:success] = "Logged in as returning user #{user.name}"
      else
        flash[:error] = "something went wrong,sry"
      end
    end
    session[:user_id] = user.id
    redirect_to root_path

  end

  def login_form
    @user = User.new
  end

  def login
    username = params[:user][:username]

    found_user = User.find_by(username: username)

    if found_user
      # We DID find a user!
      session[:user_id] = found_user.id
      flash[:message] = "Logged in as returning user!"
    else
      # We did not find an existing user. Let's try to make one!
      new_user = User.new(username: username)
      new_user.save
      # TODO: What happens if saving fails?
      session[:user_id] = new_user.id
      flash[:message] = "Created a new user. Welcome!"
    end

    return redirect_to root_path
  end

  def logout
    # TODO: What happens if we were never logged in?
    session[:user_id] = nil
    flash[:message] = "You have logged out successfully."
    return redirect_to root_path
  end

  def current
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      head :not_found
      return
    end 
  end

end
