class FeedbacksController < ApplicationController
  def create
    @referrer = request.referer
    @feedback = Feedback.new feedback_params

    authorize @feedback
    if @feedback.valid?
      FeedbackMailer.send_feedback(@feedback, @referrer).deliver_now
      redirect_back(fallback_location: root_path, notice: "feedback received, thanks!")

    else
      redirect_back(fallback_location: root_path, alert: "There was an issue with your submission!")
    end
    respond_to do |format|
      format.html     
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:full_name, :email, :topic, :comment)
  end
end
