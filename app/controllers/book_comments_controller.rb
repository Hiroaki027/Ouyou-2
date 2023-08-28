class BookCommentsController < ApplicationController

  def create
    book_comment = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book_comment.id
    comment.save
    @book = Book.find(params[:book_id])
  end

  def destroy
    @book_comment = BookComment.find(params[:id]).destroy
    @book = Book.find(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
