class TopController < ActionController::Base
require 'bcrypt'
    def main
        if session[:login_uid]
            render 'main'
        else
            render 'login'
        end
    end
    
    def login
        user = User.find_by(uid: params[:uid])
        login_password = BCrypt::Password.new(user.pass)
        if user == params[:uid] && login_password == params[:pass]
            session[:login_uid] = params[:uid]
            redirect_to root_path
        else
            render 'login_failed'
        end
=begin
        if User.find_by(uid: params[:uid], pass: params[:pass])
            session[:login_uid] = params[:uid]
            redirect_to root_path
        else
            render 'login_failed'
        end
=end
    end
    
    def logout
       session.delete(:login_uid)
       redirect_to root_path
    end
    
end
