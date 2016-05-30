module Admin
  class FeedbacksController < ApplicationController
    def index
      @feedbacks = Feedback.all
    end

    def show
      @feedback = Feedback.find(params[:id])
    end

    def destroy
      @feedback = Feedback.find(params[:id])
      @feedback.destroy
      redirect_to admin_path, notice: 'Резюме было успешно удалено'
    end
  end
end
