module AlertsHelper

  SEVERITY_ICONS = {info: "info-circle_icon", danger: "exclamation-triangle_icon", warning: "bullhorn_icon", success: "check-circle_icon"}

  def severity_icon(severity)
    SEVERITY_ICONS[severity]
  end
end
