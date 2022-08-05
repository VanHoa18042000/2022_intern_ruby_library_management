class Admin::CategoryController < AdminController
  before_action :logged_in_user
  before_action :find_category, except: %i(index new create)

  def index
    @pagy, @categories = pagy CategoryBook.latest_category,
                              items: Settings.max_page_category
  end

  def new
    @category = CategoryBook.new
  end

  def create
    @category = CategoryBook.new category_params
    if @category.save
      flash[:message] = t "category.save"
      redirect_to admin_category_index_path
    else
      flash.now[:danger] = t "category.fails"
      render :new
    end
  end

  def update
    if @category.update category_params
      flash[:message] = t "category.update"
      redirect_to admin_category_index_path
    else
      flash[:danger] = t "category.update_fails"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      render json: {"message": t("category.deleted"), "code": 200}
    else
      render json: {"message": t("category.deleted_fails"), "code": 404}
    end
  end

  private

  def category_params
    params.require(:category_book).permit :name
  end
end
