module RoomsSearchHelper
  def team_learning?(characteristics)
    (characteristics.pluck(:chrstc_descrshort) & ['TeamTables', 'TeamTech', 'TeamTables']).present?
  end

  def classrooms_buildings_select
    Building.classroom_buildings.order( 'name ASC' )

  end
end

# =f.collection_select :building_id_in, @buildings_all, :id, :name, {}, {multiple: true, onchange: 'this.form.submit();', id: 'buildings-select', 'multiple title' => 'Select Buildings', 'data-selected-text-format' => 'count > 2', 'data-live-search' => 'true', 'data-actions-box' => 'true', 'data-width' => 'fit'}
