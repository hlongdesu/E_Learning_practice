class CategoriesController < ApplicationController
  before_action :logged_in_user, only: %i(only)
  def index
    @categories = Category.newest.paginate(page: params[:page]).has_word?
  end
end
