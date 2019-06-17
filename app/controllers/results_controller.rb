class ResultsController < ApplicationController
  def new
    @lesson = Lesson.find_by id: params[:lesson_id]
    @word = (@lesson.category.words - @lesson.words).try :first
    if @word.blank?
      @lesson.update_attribute :score, @lesson.correct_answers.count
      redirect_to @lesson
    else
      @answer = @lesson.results.build
    end
    @progress = @lesson.results.count
  end

  def create
    @lesson = Lesson.find_by id: params[:lesson_id]
    @result = @lesson.results.build result_params
    redirect_to new_lesson_result_path @lesson if @result.save
  end

  private

  def result_params
    params.require(:result).permit(:word_id, :answer_id)
  end
end
