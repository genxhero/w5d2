class SubsController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  
  def new
    @sub = Sub.new 
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all 
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.mod_id = current_user.id 
    if @sub.save
      redirect_to sub_url(@sub)
    else 
      flash.now[:errors] = @sub.errors.full_messages 
      render :new
    end 
  end

  def update
    @sub = Sub.find(params[:id])

    if current_user.id != @sub.mod_id
      flash[:errors] = ["Only the moderator may edit this Sub-Reddit"]
      redirect_to sub_url(@sub) 
    end
    
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else 
      flash.now[:errors] = @sub.errors.full_messages
      render :edit 
    end 
  end
  
  def sub_params 
    params.require(:sub).permit(:title, :description)
  end 
  
end
