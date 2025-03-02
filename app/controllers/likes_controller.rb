class LikesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @like = @book.likes.create(user: current_user)

    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:book_id])
    @like = @book.likes.find(params[:id])

    if @like.destroy
      redirect_to book_path(@book), notice: 'Like removed successfully.'
    else
      redirect_to book_path(@book), alert: 'Unable to remove like.'
    end
  end

end
