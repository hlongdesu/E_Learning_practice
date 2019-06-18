class WordsController < ApplicationController
  before_action :logged_in_user, only: %i(only)

  def index
    @words = Word.order_cat.paginate page: params[:page], per_page: Settings.per_page
    if params[:learned] == Settings.checked
      @words = current_user.words.order_cat.paginate page: params[:page]

    elsif params[:learned] == Settings.notchecked
      @words = @words.where.not(id: current_user.word_ids).order_cat.paginate page: params[:page], per_page: Settings.per_page
    elsif params[:category_id]
      @words = @words.where category_id: params[:category_id]
    end
  end
end
