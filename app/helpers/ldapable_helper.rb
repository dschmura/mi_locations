# For using the ldap service to lookup memberships and user info
module LdapableHelper
  # this was developed using guidence from this gist:
  # https://gist.githubusercontent.com/jeffjohnson9046/7012167/raw/86587b9637ddc2ece7a42df774980fa9c0aac9b3/ruby-ldap-sample.rb

  # require 'rubygems'
  # require 'net/ldap'

  ##############################################################################
  # HELPER/UTILITY METHOD
  #   This method interprets the response/return code from an LDAP bind
  # operation (bind, search, add, modify, rename,delete).  This method isn't
  # necessarily complete, but it's a good starting point for handling the
  # response codes from an LDAP bind operation.
  #
  #   Additional details for the get_operation_result method can be found here:
  # http://net-ldap.rubyforge.org/Net/LDAP.html#method-i-get_operation_result
  ##############################################################################
  def get_ldap_response(ldap)
    msg = 'Response Code:'\
          "#{ldap.get_operation_result.code},"\
          " Message: #{ldap.get_operation_result.message}"
    raise msg unless ldap.get_operation_result.code.zero?
  end

  ##############################################################################
  # SET UP LDAP CONNECTION
  # Setting up a connection to the LDAP server using .new() does not actually
  # send any network traffic to the LDAP server.  When you call an operation on
  # ldap (e.g. add or search), .bind is called implicitly.  *That's* when the
  # connection is made to the LDAP server.  This means that each operation
  # called on the ldap object will create its own network connection to the LDAP
  # server.
  ##############################################################################
  # umich_bits = YAML.load_file('config/ldapable_config.yml')
  # @umich_bits = host: 'ldap.umich.edu', port: '389', base: 'dc=umich,dc=edu',
  # auth: { method: :anonymous }
  def ldap_connection
    Net::LDAP.new host: 'ldap.umich.edu',
                  port: '389',
                  base: 'dc=umich,dc=edu',
                  auth: { method: :anonymous }
    # if ldap.bind
    #   # Redundant? Sure - the code will be 0 and the message will be "Success".
    #   puts "Connection successful!  Code:  #{ldap.get_operation_result.code}, message: #{ldap.get_operation_result.message}"
    # else
    #   puts "Connection failed!  Code:  #{ldap.get_operation_result.code}, message: #{ldap.get_operation_result.message}"
    # end
  end

  # GET THE UNIQNAME FOR A SINGLE USER
  def get_uniqname(email = nil)
    search_param = email # the AD account goes here
    result_attrs = ["uid"] # Whatever you want to bring back in your result set goes here
    # Build filter
    search_filter = Net::LDAP::Filter.eq("mail", search_param)
    # Execute search
    ldap_connection.search(filter: search_filter, attributes: result_attrs) { |item|
      return item.uid.first
    }
    get_ldap_response(ldap_connection)
  end

  # GET THE DISPLAY NAME FOR A SINGLE USER
  def get_display_name(uniqname = nil)
   # the AD account goes here
    # Whatever you want to bring back in your result set goes here
    result_attrs = %w[displayName]
    search_filter = Net::LDAP::Filter.eq('uid', uniqname)
    # Execute search
    result_of_search = ldap_connection.search(filter: search_filter, attributes: result_attrs)[0]
    if result_of_search.respond_to?(:displayname)
      result_of_search = result_of_search.displayname.first
    else result_of_search = "No associated displayname"
    end
    result_of_search
  end

  def get_email(uniqname = nil)
    search_param = uniqname # the AD account goes here
    # Whatever you want to bring back in your result set goes here
    result_attrs = %w[mail]
    search_filter = Net::LDAP::Filter.eq('uid', search_param)
    # Execute search
    result_of_search = ldap_connection.search(filter: search_filter, attributes: result_attrs)[0]
    if result_of_search.respond_to?(:mail)
      result_of_search = result_of_search.mail.first
    else result_of_search = "No associated email address"
    end
    result_of_search
  end

  def get_department(uniqname = nil)

    search_param = uniqname # the AD account goes here
    # Whatever you want to bring back in your result set goes here
    result_attrs = %w[umichPostalAddressData]
    search_filter = Net::LDAP::Filter.eq('uid', search_param)
    # Execute search
    result_of_search = ldap_connection.search(filter: search_filter, attributes: result_attrs)[0]
    if result_of_search.respond_to?(:umichpostaladdressdata)
      result_of_search = result_of_search.umichpostaladdressdata.first.split('}:{').first.split('=')[1]
    else result_of_search = "No associated department"
    end
    result_of_search
  end

  ##############################################################################
  # Check if the UID is a member of an LDAP group. This function returns TRUE
  # if uid passed in is a member of group_name passed in. Otherwise it will
  # return false.
  ##############################################################################
  def member_of_group?(uid = nil, group_name = nil)
    # GET THE MEMBERS OF AN E-MAIL DISTRIBUTION LIST
    search_param = group_name # the name of the distribution list
    result_attrs = ['member']
    # Build filter
    search_filter = Net::LDAP::Filter.eq('cn', search_param)
    group_filter = Net::LDAP::Filter.eq('objectClass', 'group')
    composite_filter = Net::LDAP::Filter.join(search_filter, group_filter)
    # Execute search, extracting the AD account name from each list member
    ldap_connection.search(filter: composite_filter, attributes: result_attrs) do |item|
      item.member.each do |entry|
        if entry.split(',').first.split('=')[1] == uid
          return true
        end
      end
    end
    get_ldap_response(ldap_connection)
    false
  end

  def user_group_memberships(uid = nil)
    ldap = ldap_connection
    result_array = []
    result_attrs = ["dn"]
    ldap.search(filter: "member=uid=#{uid},ou=People,dc=umich,dc=edu", attributes: result_attrs) do |item|
      item.each {|key,value| result_array << value.first.split("=")[1].split(",")[0]}
    end
    return result_array
    get_ldap_response(ldap)
  end

  ##############################################################################
  # Get the Name email and members of an LDAP group as a hash
  ##############################################################################
  def get_email_distribution_list(group_name = nil)
    result_hash = {}
    # GET THE MEMBERS OF AN E-MAIL DISTRIBUTION LIST
    search_param = group_name # the name of the distribution list
    result_attrs = %w[cn umichGroupEmail member]
    # Build filter
    search_filter = Net::LDAP::Filter.eq('cn', search_param)
    group_filter = Net::LDAP::Filter.eq('objectClass', 'group')
    composite_filter = Net::LDAP::Filter.join(search_filter, group_filter)
    # Execute search, extracting the AD account name for each list member
    ldap_connection.search(filter: composite_filter, attributes: result_attrs) do |item|
      result_hash['group_name'] = item.cn.first
      result_hash['group_email'] = item.umichGroupEmail.first
      result_hash['members'] = item.member
    end
    get_ldap_response(ldap_connection)
    result_hash
  end

  ##############################################################################
  # Get the details of an LDAP group as a hash
  ##############################################################################

  def validate_group(gidNumber = nil)
    result_hash = {}
    # GET THE MEMBERS OF AN E-MAIL DISTRIBUTION LIST
    search_param = gidNumber # the gidNumber of the distribution list
    result_attrs = %w[dn umichDirectMember umichGroupEmail umichPrivate umichExpiryTimestamp umichDescription suppressNoEmailError joinable RealtimeBlockList Membersonly gidNumber owner objectClass objectClass objectClass objectClass objectClass objectClass objectClass objectClass member cn]
    # Build filter
    search_filter = Net::LDAP::Filter.eq('gidNumber', search_param)
    group_filter = Net::LDAP::Filter.eq('objectClass', 'group')
    composite_filter = Net::LDAP::Filter.join(search_filter, group_filter)
    # Execute search, extracting the AD account name for each list member
    ldap_connection.search(filter: composite_filter, attributes: result_attrs) do |item|
      result_hash['dn'] = item.dn
      result_hash['umichDirectMember'] = item.umichDirectMember
      result_hash['umichGroupEmail'] = item.umichGroupEmail
      result_hash['umichPrivate'] = item.umichPrivate
      result_hash['umichExpiryTimestamp'] = item.umichExpiryTimestamp
      result_hash['umichDescription'] = item.umichDescription
      result_hash['suppressNoEmailError'] = item.suppressNoEmailError
      result_hash['joinable'] = item.joinable
      result_hash['RealtimeBlockList'] = item.RealtimeBlockList
      result_hash['Membersonly'] = item.Membersonly
      result_hash['gidNumber'] = item.gidNumber
      result_hash['owner'] = item.owner
      result_hash['member'] = item.member
      result_hash['cn'] = item.cn.first
    end
    get_ldap_response(ldap)
    result_hash
  end
end
