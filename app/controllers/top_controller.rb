class TopController < ApplicationController
    def main
        @tweets = Tweet.all
        render 'main'
    end
    
    def login
        
        user = User.find_by(uid: params[:uid])
        
        if user
            
            if  BCrypt::Password.new(user.pass) == params[:pass]
                session[:login_uid]=params[:uid]
                session[:user_id] = user.id
                redirect_to '/'
            else
                flash[:alert] = '※ユーザIDかパスワードが間違ってるヨ！'
                redirect_to top_login_form_path
            end
        else
            flash[:alert] = '※ユーザIDかパスワードが間違ってるヨ！'
            redirect_to top_login_form_path
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to '/'
    end
    
end
