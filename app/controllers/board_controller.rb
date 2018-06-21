class BoardController < ApplicationController
  before_action :set_post,only:[:show,:edit,:update,:destroy]
  #index,show만 로그인 하지않은 상태에서 볼 수 있게
  #나머지는 반드시 로그인이 필요하게
  before_action :authenticate_user!, except:[:index,:show]
  
  
  
  def index
    @posts = Post.all
    
  end

  def show
    @list=Post.where(user_id: @post.user_id)

  end

  def new
    
  end

  def create
    post = Post.new
    post.title = params[:title]
    post.contents = params[:contents]
    post.user_id = current_user.id
    post.save
    #post를 등록할 때 이 글을 작성한 사람은 
    #현재 로그인 되어있는 유저이다.
    redirect_to "/board/#{post.id}"
  end
  
  def edit
  
  end
  
  def update
 
    @post.title = params[:title]
    @post.contents = params[:contents]
    @post.save
    redirect_to "/board/#{@post.id}"
  end
  
  def destroy
 
    @post.destroy
    redirect_to '/boards'
  end
  
  def set_post
    @post = Post.find(params[:id])
  end

  
  
end
