module ApplicationHelper
  include Pagy::Frontend
  # Returns the full title on a per-page basis.
  def page_title
    base_title = (t :sitename)
    if @page_title.nil?
      "#{params[:controller].capitalize} | " + base_title
    else
      "#{@page_title} | #{base_title}"
    end
  end

  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-alert"
    when :info then "alert alert-info"
    end
  end

  def svg(floor)
    # file_path = "#{Rails.root}/app/views/buildings/floors/#{name}.svg"
    # file_path = "#{Rails.root}/app/views/buildings/floors/USB_Floor_1.svg"
    file_path = floor.floor_svg
    return File.read(file_path).html_safe if File.exist?(file_path)
    file_path
  end

  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end
end
