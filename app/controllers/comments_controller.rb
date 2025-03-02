class CommentsController < ApplicationController
  before_action :set_book, only: %i[new create edit update]

  def new
    @comment = @book.comments.new
  end

  def create
    @comment = @book.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to book_path(@book), notice: 'Review added successfully.'
    else
      render :new
    end
  end

  def edit
    @comment = @book.comments.find(params[:id])
  end

  def update
    @comment = @book.comments.find(params[:id])
    @comment.user = current_user

    if @comment.update(comment_params)
      redirect_to book_path(@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.user = current_user
    if @comment.destroy
      redirect_to book_comments_path(@comment.book), notice: 'Review deleted successfully.'
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:reviews)
  end
end
