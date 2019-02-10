module Web
  module Controllers
    module GroupMembership
      class Delete
        include Web::Action

        def call(params)
          group_membership_id = params[:group_membership_id]
          membership = GroupMembershipRepository.get(group_membership_id)
          return status(404, {response: 'Membership not found'}) unless membership
          GroupMembershipRepository.delete(group_membership_id)
          response = { response: 'OK' }
          status(200, response.to_json)
        end
      end
    end
  end
end
