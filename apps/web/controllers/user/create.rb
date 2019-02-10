module Web
  module Controllers
    module User
      class Create
        include Web::Action

        # @param [String] name
        # @param [Integer] role_id
        # @param [Integer] department_id
        def call(params)
          name = params[:name]
          return status(400, {response: 'Bad input'}) unless name && !name.empty?

          department_id = params[:department_id]
          department = DepartmentRepository.get(department_id)
          return status(400, {response: 'Invalid department id'}) unless department

          role_id = params[:role_id]
          role = RoleRepository.get(role_id)
          return status(400, {response: 'Invalid role id'}.to_json) unless role

          user = UserRepository.insert(name, department_id, role_id)

          response = {
              user: {
                  name: user.name,
                  department_id: user.department_id,
                  user_id: user.user_id,
                  role_id: user.role_id
              }
          }

          status(200, response.to_json)
        end
      end
    end
  end
end
