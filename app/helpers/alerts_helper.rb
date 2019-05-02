module AlertsHelper
  SEVERITY_ICONS = {info: "info-circle", danger: "exclamation-triangle", warning: "bullhorn", success: "check-circle"}
  def severity_icon(severity)
    SEVERITY_ICONS[severity]
  end
end
