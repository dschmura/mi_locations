module RoomsSearchHelper
  def team_learning?(characteristics)
    (characteristics.pluck(:chrstc_descrshort) & ["TeamTables", "TeamTech", "TeamTables"]).present?
  end
  # Match room_characteristics to icons (fontawesome v5)
  ROOM_CHARACTERISTIC_ICONS = {
    "AssistLis" => "fas fa-assistive-listening-systems",
    "AudSeat" => "fas fa-chair",
    "Blackout" => "far fa-lightbulb",
    "BluRay" => "fas fa-compact-disc",
    "BluRay/DVD" => "fas fa-compact-disc",
    "CaptionDev" => "fas fa-closed-captioning",
    "Carpet" => "fas fa-info-circle",
    "ChairFix" => "fas fa-chair",
    "Chkbrd" => "fas fa-chalkboard-teacher",
    "Chkbrd>25" => "fas fa-chalkboard-teacher",
    "CompLabAny" => "fas fa-keyboard",
    "CompLabMac" => "fas fa-keyboard",
    "CompLabPC" => "fas fa-keyboard",
    "CompPodMac" => "fab fa-apple",
    "DocCam" => "fas fa-microscope",
    "Ethernet" => "fas fa-ethernet",
    "EthrStud" => "fas fa-ethernet",
    "FloorTier" => "fas fa-info-circle",
    "InstrComp" => "fas fa-laptop",
    "IntrScreen" => "fas fa-edit",
    "LectureCap" => "fas fa-podcast",
    "MoveTablet" => "fas fa-info-circle",
    "Platform" => "fas fa-info-circle",
    "PowerStud" => "fas fa-plug",
    "Proj16mm" => "fas fa-film",
    "Proj35mm" => "fas fa-film",
    "ProjD-Cin" => "fas fa-video",
    "ProjDigit" => "fas fa-video",
    "ProjSlide" => "fas fa-photo-video",
    "SoundPrgrm" => "fas fa-volume-up",
    "SoundVoice" => "fas fa-headset",
    "Stage" => "fas fa-info-circle",
    "TablesAny" => "fas fa-info-circle",
    "TablesConf" => "fas fa-info-circle",
    "TablesFix" => "fas fa-info-circle",
    "TablesMov" => "fas fa-info-circle",
    "TeamBoard" => "fas fa-users",
    "TeamTables" => "fas fa-info-circle",
    "TeamTech" => "fas fa-code-branch",
    "Telephone" => "fas fa-phone",
    "Tile" => "fas fa-info-circle",
    "VCR" => "fas fa-info-circle",
    "VideoConf" => "fas fa-webcam",
    "WCInst" => "fas fa-wheelchair",
    "Whtbrd" => "fas fa-chalkboard-teacher",
    "Whtbrd>25" => "fas fa-chalkboard-teacher",
    "Windows" => "fas fa-window-close",
    "Wood" => "fas fa-info-circle",
  }

  def room_characteristic_icon(room_characteristic)
    icon = ROOM_CHARACTERISTIC_ICONS[room_characteristic.chrstc_descrshort]
    "
    <a role='button' class='characteristic tooltip tooltip-top' href='' data-tooltip='#{room_characteristic.chrstc_desc254}'>
    <i class='fas fa-#{icon} fa-sm'></i>
    </a>"
  end


  def room_characteristic_chicklet(room_characteristic)
    icon = ROOM_CHARACTERISTIC_ICONS[room_characteristic.chrstc_descrshort]
    "
    <a role='button' class='characteristic-chicklet tooltip tooltip-top' href='' data-tooltip='#{room_characteristic.chrstc_desc254}'>
    <i class='fas fa-#{icon} fa-sm'></i>
    <span>#{room_characteristic.chrstc_descrshort}
    </span>
    </a>"
  end

  def is_checked?(value)
    if params[:q].present? && params[:q][:room_characteristics_chrstc_descrshort_eq_all].present?
        params[:q][:room_characteristics_chrstc_descrshort_eq_all].include?(value)
    end
  end

  def is_instructor_computer_checked?

    if params[:q].present? && params[:q][:room_characteristics_chrstc_descrshort_eq_all].present?
        params[:q][:room_characteristics_chrstc_descrshort_eq_all].include?(["InstrComp", "CompPodPC", "CompPodMAC"])
    end
  end
  # params[:q][
  # def is_checked?(value)

  #   case is_checked?
  #     when params[:q].present? && params[:q][:room_characteristics_chrstc_descrshort_eq_all].present?
  #       params[:q][:room_characteristics_chrstc_descrshort_eq_all].include?(value)


  #     when params[:q].present? && params[:q][:room_characteristics_chrstc_descrshort_eq_all].present?
  #       params[:q][:room_characteristics_chrstc_descrshort_eq_all].include?(value)

  #     when params[:q].present? && params[:q][:room_characteristics_chrstc_descrshort_eq_all].present?
  #       params[:q][:room_characteristics_chrstc_descrshort_eq_all].include?(value)
  #   end
  # end

end
