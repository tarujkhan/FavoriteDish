class SessionsController < ApplicationController
    def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
    end 
    
    session[:user_id] = @user.uid
    byebug
    render 'welcome/home'
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

def destroy
    session.clear
    redirect_to '/new'
end


def auth
    request.env['omniauth.auth'] 
end 

private
def authorize_params
    request.env.fetch('omniauth.auth')
  end
end