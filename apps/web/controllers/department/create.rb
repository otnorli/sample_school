module Web
  module Controllers
    module Department
      class Create
        include Web::Action

        def call(params)
          name = params[:name]
          return status(400, {response: 'Bad input'}) unless name && !name.empty?
          department = DepartmentRepository.insert(name)

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
