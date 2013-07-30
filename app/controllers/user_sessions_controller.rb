class UserSessionsController < ApplicationController


      def new

        @user_session = UserSession.new

      end

      

      def create

        @user_session = UserSession.new(params[:user_session])

        if @user_session.save

          flash[:notice] = "Login successful!"

          # leve me aos micropost do user logado
          
          redirect_to user_microposts_path(current_user.id)

        else

          flash[:notice] = "Login error!"

          render :action => :new

        end

      end


      def destroy

        @user_session = UserSession.find

        @user_session.destroy

        flash[:notice] = "Successfully logged out."

        redirect_to "/"

      end


    end