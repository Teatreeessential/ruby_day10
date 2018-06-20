class UserController < ApplicationController
    def index
        session.delete(:user_id)
        @currrent_user = User.find_by_user_id(session[:current_user]) if session[:current_user].nil?
    end
    
    def new
    end
    
    def create
        user=User.new
        user.user_id=params[:user_id]
        user.password = params[:password]
        user.ip_address = request.ip
        user.save
        redirect_to '/'
        
    end
    
    def edit
        
        @user = User.find(params[:id])
    end
    
    def update
        puts '업데이트 합니다.'
       user=User.find(params[:id])
       user.password = params[:password]
       user.save
       redirect_to '/'
    end
    
    def show
         @users=User.all
    end
    
    def login
        id = params[:user_id]
        pw = params[:password]
        user = User.find_by_user_id(id)
        if !user.nil? and user.password.eql?(pw)
        #해당 user_id로 가입한 유저가 있고, 패스워드도 일치 하는 경우
        session[:current_user] = user.id
        flash[:success] ="로그인에 성공했습니다."
        redirect_to '/users'
        else
        flash[:error] ="가입된 유저가 아니거나, 비밀번호가 틀립니다."
        redirect_to '/'
        end
    end
  
    def logout
        session.delete(:current_user)
        flash[:success]="로그아웃에 성공했습니다."
        redirect_to '/'
    end

end
