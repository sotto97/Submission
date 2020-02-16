class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

	def new
		book = Book.new
	end

	def show
		@book_new = Book.new
		@user = User.find(current_user.id)
		@book = Book.find(params[:id])
	end

	def index
		@user = User.find(current_user.id)
		# user = User.find(params[:id])
		@book_new = Book.new
		@books = Book.all
	end

	def create
			@user = User.find(current_user.id)
			@book_new = Book.new(book_params)
			@books = Book.all
			@book_new.user_id = current_user.id
			if @book_new.save
				flash[:notice]='successfully'
				redirect_to book_path(@book_new.id)
			else
				render :index
			end
	end

	def edit
		# @user = User.find(current_user)
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice]='successfully'
			redirect_to book_path(@book.id)
		else
			flash[:notice]='error'
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end


	def ensure_correct_user
	  @book = Book.find(params[:id])
	  if current_user.id != @book.user_id
	    flash[:notice] = "error"
	    redirect_to books_path
	  end
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
