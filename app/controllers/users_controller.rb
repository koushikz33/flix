class UsersController < ApplicationController
    before_action :require_signin , except: [:new , :create]
    before_action :require_correct_user , only: [:edit , :update , :destroy]
    

    
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @favorite_movies = @user.favorite_movies
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to @user , notice: "Thanks for signing up"
        else
            render :new , status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @user.update(user_params) 
            redirect_to @user, notice: "user info has been updated"
        else
            render :edit , status: unprocessable_identity
        end
    end

    def destroy
        session[:user_id] = nil
        @user.destroy
        redirect_to movies_url , status: :see_other
    end

    private
        def user_params
            params.require(:user).permit("name" , "email" , "password" , "password_confirmation")
        end

        def require_correct_user
            @user = User.find(params[:id])
            unless current_user?(@user)
               redirect_to root_url , status: :see_other , notice: "Please sign in" 
            end
        end
end
