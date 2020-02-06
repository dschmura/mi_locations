module RoomsSearchHelper
  def team_learning?(characteristics)
    (characteristics.pluck(:chrstc_descrshort) & ["TeamTables", "TeamTech", "TeamTables"]).present?
  end
  # Match room_characteristics to icons (fontawesome v5)

  ROOM_CHARACTERISTIC_ICONS = {
    "AssistLis" => "assistive-listening-systems",
    "AudSeat" => "chair",
    "Blackout" => "lightbulb",
    "BluRay" => "compact-disc",
    "BluRay/DVD" => "compact-disc",
    "CaptionDev" => "closed-captioning",
    "Carpet" => "info-circle",
    "ChairFix" => "chair",
    "Chkbrd" => "chalkboard-teacher",
    "Chkbrd>25" => "chalkboard-teacher",
    "CompLabAny" => "keyboard",
    "CompLabMac" => "keyboard",
    "CompLabPC" => "keyboard",
    "CompPodMac" => "apple",
    "DocCam" => "microscope",
    "Ethernet" => "ethernet",
    "EthrStud" => "ethernet",
    "FloorTier" => "info-circle",
    "InstrComp" => "laptop",
    "IntrScreen" => "edit",
    "LectureCap" => "podcast",
    "MoveTablet" => "info-circle",
    "Platform" => "info-circle",
    "PowerStud" => "plug",
    "Proj16mm" => "film",
    "Proj35mm" => "film",
    "ProjD-Cin" => "video",
    "ProjDigit" => "video",
    "ProjSlide" => "photo-video",
    "SoundPrgrm" => "volume-up",
    "SoundVoice" => "headset",
    "Stage" => "info-circle",
    "TablesAny" => "info-circle",
    "TablesConf" => "info-circle",
    "TablesFix" => "info-circle",
    "TablesMov" => "info-circle",
    "TeamBoard" => "users",
    "TeamTables" => "info-circle",
    "TeamTech" => "code-branch",
    "Telephone" => "phone",
    "Tile" => "info-circle",
    "VCR" => "info-circle",
    "VideoConf" => "satellite",
    "WCInst" => "wheelchair",
    "Whtbrd" => "chalkboard-teacher",
    "Whtbrd>25" => "chalkboard-teacher",
    "Windows" => "window-close",
    "Wood" => "info-circle",
  }

  def room_icon(room_characteristic)
    icon = ROOM_CHARACTERISTIC_ICONS[room_characteristic.chrstc_descrshort]
  end

  def room_characteristic_icon_new(room_characteristic)
    "#{ROOM_CHARACTERISTIC_ICONS[room_characteristic.chrstc_descrshort]}_icon"
  end

  def is_checked?(values)
    if params[:q]
      values.each do |value|
        params[:q].each_value { |k| k }.flatten(2).include?(value)
      end
    end
  end

  def capacity_slider_minimum
    if params[:q]
      if params[:q][:instructional_seating_count_gteq]
        params[:q][:instructional_seating_count_gteq]
      else
        1
      end
      else
      1
    end
  end
  def capacity_slider_maximum
    if params[:q]
      if params[:q][:instructional_seating_count_lteq]
        params[:q][:instructional_seating_count_lteq]
      else
        600
      end
    else
      600
    end
  end
end
