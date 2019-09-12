class RoomDecorator < Draper::Decorator
  delegate_all
  decorates_association :room_characteristics

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
    def title
      "#{room.room_number} #{room.building.nick_name.titleize}"
    end

    def created_at
      helpers.content_tag :span, class: 'time' do
        object.created_at.strftime("%a %m/%d/%y")
      end
    end

end
