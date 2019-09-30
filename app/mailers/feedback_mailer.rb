class FeedbackMailer < ApplicationMailer
  def send_feedback(feedback)
    @greeting = feedback.topic
    @body = feedback.comment
    mail to: "mi.locations.feedback@umich.edu", subject: @greeting, from: feedback.email, bcc: feedback.email
  end
end