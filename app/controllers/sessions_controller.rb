class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in
  
    def home 
    end 
  
    def new 
    end 
  
    def create
        #byebug
      @user = User.find_by(name: params[:user][:name])
    
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id 
          redirect_to user_path(@user)
        else
          flash[:error] = "Sorry, login info was incorrect. Please try again."
          redirect_to login_path
        end
    end
  
    def omniauth
      #byebug
        @user = User.create_by_facebook_omniauth(auth)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          redirect_to '/'
        end
    end
  
    def destroy 
        session.clear  
        redirect_to '/'
    end 
    
    private
    
    def auth
        request.env['omniauth.auth']
    end

end