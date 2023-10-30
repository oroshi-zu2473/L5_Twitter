class TopController < ApplicationController
    def main
        render 'login_form'
    end
    
    def login
        
        user = User.find_by(uid: params[:uid])
        
        if user
            
            if  BCrypt::Password.new(user.pass) == params[:pass]
                session[:login_uid]=params[:uid]
                redirect_to tweets_index_path
            else
                flash[:alert] = '※ユーザIDかパスワードが間違ってるヨ！'
                redirect_to '/'
            end
        else
            flash[:alert] = '※ユーザIDかパスワードが間違ってるヨ！'
            redirect_to '/'
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to '/'
    end
    
end
