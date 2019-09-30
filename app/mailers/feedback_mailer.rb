class FeedbackMailer < ApplicationMailer
  def send_feedback(feedback)
    @greeting = feedback.topic
    @body = feedback.comment
    mail to: "mi.locations.feedback@umich.edu", subject: @greeting, from: feedback.email, bcc: feedback.email
  end
end

# MI_LOCATIONS_EMAIL_SERVER
# MI_LOCATIONS_EMAIL_DOMAIN
# MI_LOCATIONS_EMAIL_MAIL_TO
# MI_LOCATIONS_EMAIL_USERNAME
# MI_LOCATIONS_EMAIL_PASSWORD
