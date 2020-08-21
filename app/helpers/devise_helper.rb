# frozen_string_literal: true

# devise helper
module DeviseHelper
  def devise_error_messages!
    return if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg|
      content_tag(:p, "- #{msg}.")
    }.join
    sentence = I18n.t("errors.messages.not_saved",
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
      <div class="p-4 mb-4 text-red-700 bg-red-100 border-l-4 border-red-500" role="alert">
          <p class="font-bold">Oops!</p>
          <p>#{sentence}</p>#{messages}
      </div>
    HTML

    html.html_safe
  end

  def devise_simple_error_messages!
    return if resource.errors.empty?

    sentence = "Ooops!"
    if resource.errors.count == 1
      message = resource.errors.full_messages[0]
      html = <<-HTML
        <div class="p-4 border-l-4 bg-red-lightest border-red text-orange-dark" role="alert">
          <p class="font-bold">#{sentence}</p>
          <p> #{message}.</p>
        </div>
      HTML
    else
      messages = resource.errors.full_messages.map { |msg|
        content_tag(:li, "#{msg}.")
      }.join
      html = <<-HTML
        <div class="p-4 mb-4 text-red-700 bg-red-100 border-l-4 border-red-500" role="alert">
          <p class="font-bold">#{sentence}</p>
          <ul class="list-disc">
            #{messages}
          </ul>
        </div>
      HTML
    end

    html.html_safe
  end
end
