module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter_params(filtering_params)
      results = where(nil)
      filtering_params.each do |key, value|
        results = results.public_send(key) if key.present?
      end
      results
    end
  end

  def filter_composer(filters)
    return Room.classrooms.pluck(:rmrecnbr) if filters.empty?
    query = ""
      filters.values[0].each do |filter|
        if filter != nil
          query += "SELECT rmrecnbr
          FROM room_characteristics
          WHERE
          chrstc_descrshort IN ('#{filter}')#{filter == filters.values[0].last ? '' : ' INTERSECT '}"
        end
      end
    ActiveRecord::Base.connection.exec_query(query).rows.flatten
  end
end
