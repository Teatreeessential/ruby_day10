class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #현재 로그인 된 상태니?
  helper_method :user_signed_in?
 
  def user_signed_in?
     !session[:current_user].nil?
  end
  
   #로그인이 되어있지 않으면 로그인하는 페이지로 이동 시켜줘
   def authenticate_user!
      unless user_signed_in?
       redirect_to '/login'  
      end
   end
  #현재 로그인 된 사람이 누구니?
  
  def current_user
    #현재 로그인됐니?
    if user_signed_in?
        @current_user = User.find(session[:current_user])
    else
        redirect_to '/login'
    end
  end
  
end
