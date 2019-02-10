module Web
  module Controllers
    module Group
      class Show
        include Web::Action

        def call(params)
          group_id = params[:group_id]
          group = GroupRepository.get(group_id)
          return status(404, {response: 'Group not found'}) unless group

          response = {
              group: {
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
