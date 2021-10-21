class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    # skip_before_action :redirect_if_not_logged_in, only: [:new, :create, :welcome]
    def new
    end
    
    def home
        if session[:user_id]
          @user = User.find_by_id(session[:user_id])
        redirect_to users_path(@user)
    else 
        render :home
       end
    end
    
    def create
        # byebug
    @user = User.find_by(email: params[:session][:email])
        # u.name = auth['info']['name']
        # u.email = auth['info']['email']
        # u.uid = auth['info']['uid']
        byebug
        if @user && @user.authenticate(params[:session][:password])  
    session[:user_id] = @user.uid
    #  byebug
    redirect_to user_dishes_path
        else 
    flash[:message] = "User is not authenticated"
    render :new
   end
end

    def omniauth
    @user = User.from_omniauth(auth)

    @user.save
    # byebug
    if @user.valid?
        session[:user_id] = @user.id 
         #byebug
        redirect_to users_path(@user)
    else 
    #    render :new 
    redirect_to '/'
    end
    end
    
    def new
        @user = User.new
    end 

    def login
       @user = User.find(session[:user_id])
    end 

def destroy
    session.clear
    redirect_to '/'
end


def auth
    request.env['omniauth.auth'] 
end 

private
def authorize_params
    request.env.fetch('omniauth.auth')
  end
end