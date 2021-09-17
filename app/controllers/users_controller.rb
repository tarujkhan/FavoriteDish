class UsersController < ApplicationController
def index
    # @users = User.all
end

def show
    @user = User.find(params[:id])
    @user - current_user
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