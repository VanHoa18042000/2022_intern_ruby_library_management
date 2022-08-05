class Admin::AuthorsController < ApplicationController
  layout "admin"

  # before_action :logged_in_user
  before_action :find_by_id, only: %i(show destroy edit update)

  def index
    @pagy, @authors = pagy Author.latest_author,
                           items: Settings.author.max_page
  end

  def new
    @author = Author.new
    respond_to do |format|
      format.js do
        render :show_form, locals: {action: params[:action]}
      end
    end
  end

  def create
    @author = Author.new author_params
    return unless @author.save

    respond_to do |format|
      @pagy, @authors = pagy Author.latest_author,
                             items: Settings.author.max_page

      format.js do
        render :update, locals: {action: params[:action]}
      end
    end
  end

  def show; end

  def edit
    respond_to do |format|
      format.js do
        render :show_form, locals: {action: params[:action]}
      end
    end
  end

  def update
    return unless @author.update author_params

    @authors = Author.latest_author
    respond_to do |format|
      format.js do
        render :update, locals: {action: params[:action]}
      end
    end
  end

  def destroy
    if @author.destroy
      render json: {"message": t(".deleted"), "code": 200}
    else
      render json: {"message": t(".deleted_fails"), "code": 404}
    end
  end

  private

  def find_by_id
    @author = Author.find_by id: params[:id]
    return if @author

    flash[:danger] = t ".not_found_author"
    redirect_to admin_author_path
  end

  def author_params
    params.require(:author).permit Author::FIELD_PERMIT
  end
end
