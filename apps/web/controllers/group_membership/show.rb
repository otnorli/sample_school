module Web
  module Controllers
    module GroupMembership
      class Show
        include Web::Action

        def call(params)
          group_membership_id = params[:group_membership_id]
          membership = GroupMembershipRepository.get(group_membership_id)
          return status(404, {response: 'Membership not found'}) unless membership

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
