class PagesController < ApplicationController
  skip_before_action :redirect_https
  skip_after_action :verify_policy_scoped, only: :index
  def index
    @q = Room.classrooms.ransack(params[:q])
    @searchable_buildings =  Building.ann_arbor_campus.with_classrooms.uniq.pluck(:nick_name, :abbreviation).sort
  end

  def about
    authorize :page

  end

  def wads_tour
    authorize :page
    @panos =  [["1_entrance_hall", "Main Entrance"], ["2_meeting_room", "Meeting Room"], ["3_huddle_room", "Huddle Room"]]

    @panos = full_panos
  end

  def contact
    authorize :page
  end

  def privacy
    authorize :page
  end

  def project_status
    authorize :page
  end
end

def full_panos
  [["1_entrance_hall", "Main Entrance"], ["2_meeting_room", "Meeting Room"], ["3_huddle_room", "Huddle Room"], ["6_huddle_room", "Huddle Room"], ["4_phone_booth", "Phone Booth"], ["8_phone_booth", "Phone Booth"], ["5_hallway", "Hallway"], ["7_hallway", "Hallway"], ["9_collab_space", "Collab Space"], ["11_unassigned_seating", "Unassigned Seating"], ["13_unassigned_seating", "Unassigned Seating"], ["12_cubicles", "Cubicles"], ["14_cubicles", "Cubicles"], ["15_cubicles", "Cubicles"], ["16_cubicles", "Cubicles"], ["17_situation_room", "Situation Room"], ["18_copy_room", "Copy Room"], ["19_kitchen", "Kitchen"], ["21_kitchen", "Kitchen"], ["22_hallway", "Hallway"], ["23_hallway", "Hallway"], ["24_pats_office", "Pat's Office"], ["25_training_room", "Training Room"], ["26_hallway", "Hallway"], ["27_balcony", "Balcony"]]
end