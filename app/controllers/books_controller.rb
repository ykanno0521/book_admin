class BooksController < ApplicationController

  # CSRF対策をOFFにする
  protect_from_forgery except: [:destroy]
  # @book.find(params[:id])を共通化してshowとdestroyアクション前に実行
  before_action :set_book, only: [:show, :destroy]

  def show
    # @book = Book.find(params[:id])
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
    render :show #renderを省略しても暗黙的に解釈されるので、描画される
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html {redirect_to "/"}
      format.json {head :no_content}
    end
  end

  def set_book
    @book = Book.find(params[:id])
  end

end
