class UsersController < ApplicationController
    # skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

def index
    @users = User.all
    #byebug
end

def signup
end

def sign_out
end


def show
    @user = User.find(params[:id])
    # @user = current_user
end

def new 
    @user = User.new
end

def create
    @user = User.create(new_user)
    if @user.id
        session[:id] = @user.id
        redirect_to @user
    else
        render :new
    end 
end

def update
end

def delete
end

private
def new_user
    params.require(:user).permit(:name, :email, :password)
end 
end


# need sign and sign out here and log in and log out in sessions controller 
# get and post will their own routes - get sign in and post sign in
# helper methods should not be used for all methods like index
# helper methods should be inside the application controller