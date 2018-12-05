module RoomsSearchHelper
  def team_learning?(characteristics)
    (characteristics.pluck(:chrstc_descrshort) & ['TeamTables', 'TeamTech', 'TeamTables']).present?
  end
end
