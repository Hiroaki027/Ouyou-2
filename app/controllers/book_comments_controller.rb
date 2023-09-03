class BookCommentsController < ApplicationController

  def create
    @book_comment = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book_comment.id
    @book = Book.find(params[:book_id])
    unless @comment.save
      render 'error'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = @book.book_comments.find(params[:id])
    book_comment.destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
