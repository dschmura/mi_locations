class UpdateUserGroupsJob < ApplicationJob
  include LdapableHelper
  queue_as :default

  def perform(*args)
    # Do something later

    user = self.arguments.first

      user.mcommunity_groups = user_group_memberships(user.uniqname).sort.to_json

      user.save
      puts "UPDATED GROUPS"

  end
end
