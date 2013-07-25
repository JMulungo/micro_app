class MicropostsController < ApplicationController

  load_and_authorize_resource :user
  load_and_authorize_resource through: :user

  # GET /microposts
  # GET /microposts.json
  before_filter :get_user
  before_filter :get_micropost, only: [:show, :edit, :update, :destroy] 

  def index

    #@user = User.find(params[:user_id])
    #@microposts = Micropost.all
    @microposts = @user.microposts


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @microposts }
    end
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show

    #@user = User.find(params[:user_id])
    #@micropost = Micropost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @micropost }
    end
  end

  # GET /microposts/new
  # GET /microposts/new.json
  def new

    #@user = User.find(params[:user_id])
    @micropost = Micropost.new(:user_id => @user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @micropost }
    end
  end

  # GET /microposts/1/edit
  def edit
    #@user = User.find(params[:user_id])
    #@micropost = Micropost.find(params[:id])
  end

  # POST /microposts
  # POST /microposts.json
  def create
    
    #@user = User.find(params[:user_id])
    @micropost = Micropost.new(params[:micropost])

    respond_to do |format| 
      if @micropost.save
        format.html { redirect_to [@user, @micropost], notice: 'Micropost was successfully created.' }
        format.json { render json: @micropost, status: :created, location: @micropost }
      else
        format.html { render action: "new" }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /microposts/1
  # PUT /microposts/1.json
  def update
    
    #@micropost = Micropost.find(params[:id])
    #@user = User.find(params[:user_id])

    respond_to do |format|
      if @micropost.update_attributes(params[:micropost])
        format.html { redirect_to [@user, @micropost], notice: 'Micropost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    #@user = User.find(params[:user_id])
    #@micropost = Micropost.find(params[:id])
    @micropost.destroy

    respond_to do |format|
      format.html { redirect_to user_microposts_path(@user) }
      format.json { head :no_content }
    end
  end

  def get_user
    @user = User.find(params[:user_id])
  end

    def get_micropost
    @micropost = Micropost.find(params[:id])
  end

end
