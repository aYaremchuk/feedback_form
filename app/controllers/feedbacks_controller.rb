class FeedbacksController < ApplicationController
  def index
    @feedbacks = Feedback.all
  end

  def new
   @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      flash[:success] = "Мы ждем вас в #{@feedback.date}"
      redirect_to @feedback
      # redirect_to feedbacks_path, notice: "The feedback from #{@feedback.name} has been uploaded."
    else
      render :new
    end
  end

  def show
    @feedback = Feedback.find(params[:id])
  end

  private
  def feedback_params
    params.require(:feedback).permit(:name, :birthday, :date_date, :date_time, :attachment)
  end
end
