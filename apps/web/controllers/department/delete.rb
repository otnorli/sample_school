module Web
  module Controllers
    module Department
      class Delete
        include Web::Action

        def call(params)
          department_id = params[:department_id]
          department = DepartmentRepository.get(department_id)
          return status(404, {response: 'Department not found'}) unless department
          DepartmentRepository.new.delete(department_id)
          response = { response: 'OK' }
          status(200, response.to_json)
        end
      end
    end
  end
end
