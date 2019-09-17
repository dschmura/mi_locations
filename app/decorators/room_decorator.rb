class RoomDecorator < Draper::Decorator
  def self.collection_decorator_class
    PaginatingDecorator
  end
  delegate_all
  decorates_association :room_characteristics
  DEPARTMENTS = {
    "" => "All Units",
    "ACAD_&_BDGT_AFFAIRS" => "Academic and Budget Affairs" ,
    "COLLEGE_ENGINEERING" => "College of Engineering" ,
    "COLLEGE_OF_LSA" => "College of LSA" ,
    "COLLEGE_PHARMACY" => "College of Pharmacy" ,
    "COLL_ARCH_URN_PLN" => "College of Architecture and Urban Planning" ,
    "DBN_CHANCELLOR" => "Dearborn Chancellor" ,
    "DBN_COL_ARTS_SCI_LTR" => "Dearborn College of Arts, Science and Literature" ,
    "DBN_COL_BUSINESS" => "Dearborn College of Business" ,
    "DBN_COL_EDU_HLT_HS" => "Dearborn College of Education, Health, & Human Services" ,
    "DBN_COL_ENGINEERING" => "Dearborn College of Engineering & Computer Science" ,
    "DBN_LIBRY_MEDIA_SRVS" => "Dearborn Library Media Services" ,
    "DSA_HOUSING_SERVICES" => "Dearborn Housing Services" ,
    "FLINT_CAS" => "Flint College of Arts & Sciences" ,
    "FLINT_HLTH_PROF_STUD" => "Flint College of Health Sciences" ,
    "FLINT_MGMT_DEAN" => "Flint School of Management" ,
    "FLINT_PROVOST" => "Flint Office of the Provost" ,
    "FLINT_SCHEDU_HMN_SVS" => "Flint School of Education & Human Services" ,
    "FLINT_VC_ENROLLMENT" => "Flint Enrollment Management" ,
    "INST_SOC_RESEARCH" => "Institute for Social Research" ,
    "INTERCOLLEG_ATHLETIC" => "Intercollegiate Athletics" ,
    "LAW_SCHOOL" => "Law School" ,
    "MEDICAL_SCHOOL" => "Medical School" ,
    "SCHOOL_BUS_ADMIN" => "Ross School of Business" ,
    "SCHOOL_DENTISTRY" => "School of Dentistry" ,
    "SCHOOL_EDUCATION" => "School of Education" ,
    "SCHOOL_INFORMATION" => "School of Information" ,
    "SCHOOL_KINESIOLOGY" => "School of Kinesiology" ,
    "SCHOOL_MUSIC" => "School of Music, Theatre and Dance" ,
    "SCHOOL_NAT_RES_ENVIR" => "School for Environment and Sustainability" ,
    "SCHOOL_NURSING" => "School of Nursing" ,
    "SCHOOL_PUB_HEALTH" => "School of Public Health" ,
    "SCHOOL_PUB_POLICY" => "School of Public Policy" ,
    "SCHOOL_SOCIAL_WORK" => "School of Social Work" ,
    "VP_ACAD_GRAD_STUDY" => "Museum of Art"
  }


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

  def department_name
    DEPARTMENTS[object.dept_grp]
  end
  def copy_text
    %Q(#{self.title} : #{room.building.address}, #{room.building.city}. You can find details at  )
  end
end
class PaginatingDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_pages, :limit_value, :entry_name, :total_count, :offset_value, :last_page?, :next_page
end
