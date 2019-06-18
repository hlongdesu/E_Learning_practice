class CategoriesController < ApplicationController
  before_action :logged_in_user, only: %i(index)
  def index
    @categories = Category.newest.paginate(page: params[:page]).has_word?
    if params[:learned] == Settings.checked
      @categories = current_user.categories.newest.paginate page: params[:page]
    elsif params[:learned] == Settings.notchecked
      @categories = @categories.newest.where.not(id: current_user.category_ids).paginate page: params[:page]
    end
  end
end
