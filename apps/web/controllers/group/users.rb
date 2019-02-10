module Web
  module Controllers
    module Group
      class Users
        include Web::Action

        def call(params)
          group_id = params[:group_id]
          group = GroupRepository.get(group_id)
          return status(404, {response: 'Group not found'}) unless group
          users = GroupRepository.new.find_with_users(group_id)

          response = {
              group: {
                  users: users,
                  name: group.name,
                  department_id: group.department_id,
                  group_id: group.group_id
              }
          }

          status(200, response.to_json)
        end
      end
    end
  end
end
