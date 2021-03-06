class BooksController < ApplicationController
  authorize_resource class: :books

  def index
    if params[:search].present?
      @books = Book.where("title like '%#{params[:search]}%'").paginate(page: params[:page], per_page: 10)
    else
      @books = Book.paginate(page: params[:page], per_page: 10)
    end

  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path
    else
      render :new
    end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    @book.assign_attributes(book_params)
    if @book.save
      redirect_to books_path, notice: "Livro foi Atualizado com sucesso"
    else
      render :edit
    end

  end

  # def destroy
  #   @book = Book.find(params[:id])
  #
  #   if @book.destroy
  #     redirect_to books_path
  #   end
  # end

  def destroy
    respond_to do |format|
      begin
        @book.delete
        format.html { redirect_to authors_path, notice: "Livro removido com sucesso" }
        format.js
      rescue
        format.html { redirect_to authors_path, notice: "Livro não pode ser removido" }
        format.js
      end
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :publication_year, :author_id, :resume, :total_pages, :cover)
  end

end
