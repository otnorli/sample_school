module Web
  module Controllers
    module Group
      class Create
        include Web::Action

        def call(params)
          name = params[:name]
          return status(400, {response: 'Bad input'}) unless name && !name.empty?

          department_id = params[:department_id]
          department = DepartmentRepository.get(department_id)
          return status(404, {response: 'Department not found'}) unless department

          group = GroupRepository.insert(name, department_id)

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
