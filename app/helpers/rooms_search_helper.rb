module RoomsSearchHelper
  def team_learning?(characteristics)
    (characteristics.pluck(:chrstc_descrshort) & ['TeamTables', 'TeamTech', 'TeamTables']).present?
  end
  # Match room_characteristics to icons (fontawesome v5)
  ROOM_CHARACTERISTIC_ICONS = {
    'AssistLis' => 'fas fa-assistive-listening-systems',
    'AudSeat' => 'fas fa-info-circle',
    'Blackout' => 'far fa-lightbulb',
    'BluRay' => 'fas fa-compact-disc',
    'BluRay/DVD' => 'fas fa-compact-disc',
    'CaptionDev' => 'fas fa-closed-captioning',
    'Carpet' => 'fas fa-info-circle',
    'ChairFix' => 'fas fa-info-circle',
    'Chkbrd' => 'fas fa-chalkboard',
    'Chkbrd>25' => 'fas fa-chalkboard',
    'CompLabAny' => 'fas fa-keyboard',
    'CompLabMac' => 'fas fa-keyboard',
    'CompLabPC' => 'fas fa-keyboard',
    'CompPodMac' => 'fab fa-apple',
    'DocCam' => 'fas fa-microscope',
    'Ethernet' => 'fas fa-ethernet',
    'EthrStud' => 'fas fa-ethernet',
    'FloorTier' => 'fas fa-info-circle',
    'InstrComp' => 'fas fa-laptop',
    'IntrScreen' => 'fas fa-edit',
    'LectureCap' => 'fas fa-podcast',
    'MoveTablet' => 'fas fa-info-circle',
    'Platform' => 'fas fa-info-circle',
    'PowerStud' => 'fas fa-plug',
    'Proj16mm' => 'fas fa-film-alt',
    'Proj35mm' => 'fas fa-film-alt',
    'ProjD-Cin' => 'fas fa-video',
    'ProjDigit' => 'fas fa-video',
    'ProjSlide' => 'fas fa-presentation',
    'SoundPrgrm' => 'fas fa-volume-up',
    'SoundVoice' => 'fas fa-headset',
    'Stage' => 'fas fa-info-circle',
    'TablesAny' => 'fas fa-info-circle',
    'TablesConf' => 'fas fa-info-circle',
    'TablesFix' => 'fas fa-info-circle',
    'TablesMov' => 'fas fa-info-circle',
    'TeamBoard' => 'fas fa-users-class',
    'TeamTables' => 'fas fa-info-circle',
    'TeamTech' => 'fas fa-code-branch',
    'Telephone' => 'fas fa-phone',
    'Tile' => 'fas fa-info-circle',
    'VCR' => 'fas fa-info-circle',
    'VideoConf' => 'fas fa-webcam',
    'WCInst' => 'fas fa-wheelchair',
    'Whtbrd' => 'fas fa-chalkboard',
    'Whtbrd>25' => 'fas fa-chalkboard',
    'Windows' => 'fas fa-window-close',
    'Wood' => 'fas fa-info-circle'}
  def room_characteristic_icon(room_characteristic)
    icon = ROOM_CHARACTERISTIC_ICONS[room_characteristic.chrstc_descrshort]
    "
    <a role='button' class='toolytip' href='header_edit.php'><span class='tooltiptext' style=''>#{room_characteristic.chrstc_descr}</span><i class='fas fa-#{icon} fa-sm'></i></a>"
    # room_characteristic.chrstc_descrshort.to_s




  end

end
