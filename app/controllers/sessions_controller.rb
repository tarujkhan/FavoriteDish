class SessionsController < ApplicationController
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
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        end 
    
    session[:user_id] = @user.uid
    # byebug
    render :home
    end

    def omniauth
    @user = User.from_omniauth(auth)

    @user.save
     #byebug
    if @user.valid?
        session[:user_id] = @user.id 
        #  byebug
        redirect_to @user
    else 
    #    render :new 
    redirect_to '/'
    end
end

    def login
        @user = User.find[params[:id]]
    end 

def destroy
    session.clear
    redirect_to '/login'
end


def auth
    request.env['omniauth.auth'] 
end 

private
def authorize_params
    request.env.fetch('omniauth.auth')
  end
end