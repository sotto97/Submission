class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_correct_user, {only: [:edit, :update]}

	def show
		@user = User.find(params[:id])
		@book_new = Book.new
		@books = @user.books.page(params[:page]).reverse_order
		# @book = Book.find(params[:id])
	end

	def index
		@user = User.find(current_user.id)
		@users = User.all
		@book_new = Book.new
	end

	def new
	end

  def create
  end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice]='successfully'
			redirect_to user_path(@user.id)
		else
			flash[:notice]='error'
			render :edit
		end
	end

	def ensure_correct_user
	  @user = User.find(params[:id])
	  if current_user.id != params[:id].to_i
	    flash[:notice] = "error"
	    redirect_to user_path(current_user)
	  end
	end
	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
end
