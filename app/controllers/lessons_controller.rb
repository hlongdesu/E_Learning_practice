class LessonsController < ApplicationController
  before_action :logged_in_user, only: [:show, :create]

  def create
    @category = Category.find_by id: params[:category_id]
    @lesson = current_user.lessons.create category: @category
    redirect_to new_lesson_result_path @lesson
  end

  def show
    @lesson = Lesson.find_by id: params[:id]
    @results = @lesson.results
  end
end
