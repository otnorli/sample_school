module Web
  module Controllers
    module Department
      class Update
        include Web::Action

        def call(params)
          name = params[:name]
          return status(400, {response: 'Bad input'}) unless name && !name.empty?
          department_id = params[:department_id]
          existing_department = DepartmentRepository.get(department_id)
          return status(404, {response: 'Department not found'}) unless existing_department
          department = DepartmentRepository.update(department_id, name)

          response = {
              department: {
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
