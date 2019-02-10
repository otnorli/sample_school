module Web
  module Controllers
    module GroupMembership
      class Create
        include Web::Action

        def call(params)
          group_id = params[:group_id]
          group = GroupRepository.get(group_id)
          return status(400, {response: 'Invalid group id'}) unless group

          user_id = params[:user_id]
          user = UserRepository.get(user_id)
          return status(400, {response: 'Invalid user id'}) unless user

          unless user.department_id == group.department_id
            return status(400, {response: 'User not in same department as group'})
          end

          if GroupMembershipRepository.new.existing_membership(user_id, group_id)
            return status(400, {response: 'User already added to group'})
          end

          membership = GroupMembershipRepository.insert(user_id, group_id)

          response = {
              group_membership: {
                  user_id: membership.user_id,
                  group_id: membership.group_id,
                  group_membership_id: membership.group_membership_id
              }
          }

          status(200, response.to_json)
        end
      end
    end
  end
end
