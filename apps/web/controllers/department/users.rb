module Web
  module Controllers
    module Department
      class Users
        include Web::Action

        def call(params)
          department_id = params[:department_id]
          department = DepartmentRepository.get(department_id)
          return status(404, {response: 'Department not found'}) unless department

          users = UserRepository.new.by_department(department_id)

          response = {
              department: {
                  users: users,
                  name: department.name,
                  department_id: department.department_id
              }
          }

          status(200, response.to_json)
        end
      end
    end
  end
end
