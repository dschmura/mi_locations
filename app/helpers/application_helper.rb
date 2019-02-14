module ApplicationHelper
  # Returns the full title on a per-page basis.
  def page_title
    base_title = (t :site_name)
    if @page_title.nil?
      "#{params[:controller].capitalize} | " + base_title
    else
      "#{@page_title} | #{base_title}"
    end
  end

  def flash_class(level)
    case level
    when :notice  then 'alert alert-info'
    when :success then 'alert alert-success'
    when :error   then 'alert alert-error'
    when :alert   then 'alert alert-error'
    end
  end

  def is_checked?(param)
    if params[:q].instance_values.to_json.include?(param)
      true
    else
      false
    end
  end

  def svg(floor)
  # file_path = "#{Rails.root}/app/views/buildings/floors/#{name}.svg"
  # file_path = "#{Rails.root}/app/views/buildings/floors/USB_Floor_1.svg"
  file_path = floor.floor_svg
    return File.read(file_path).html_safe if File.exists?(file_path)
  file_path
  end
end
