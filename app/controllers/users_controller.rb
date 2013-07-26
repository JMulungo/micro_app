class UsersController < ApplicationController
  
#load_and_authorize_resource

# temporaio index
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def new

      @user = User.new

    end


    def edit

      @user = current_user

    end


    def create

      @user = User.new(params[:user])

      if @user.saveusers

        flash[:notice] = "Create successful!"

        redirect_to user_sessions_new_path

      else

        render :action => 'new'

      end

    end


    def update

      @user = current_user


      if @user.update_attributes params[:user]

        flash[:notice] = "Update successful!"

        redirect_to "/my_account"

      else

        render :action => :edit

      end

    end
end
