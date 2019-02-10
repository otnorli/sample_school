module Web
  module Controllers
    module GroupMembership
      class Update
        include Web::Action

        def call(params)
          group_id = params[:group_id]
          group = GroupRepository.get(group_id)
          return status(400, {response: 'Invalid group id'}) unless group

          user_id = params[:user_id]
          user = UserRepository.get(user_id)
          return status(400, {response: 'Invalid user id'}) unless user

          puts user.department_id
          puts group.department_id

          unless user.department_id == group.department_id
            return status(400, {response: 'User not in same department as group'})
          end

          group_membership_id = params[:group_membership_id]
          existing_membership = GroupMembershipRepository.get(group_membership_id)
          return status(404, {response: 'Membership not found'}) unless existing_membership

          # TODO: Similar to in create, check if user and group_id create an existing membership

          membership = GroupMembershipRepository.update(group_membership_id, user_id, group_id)

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
