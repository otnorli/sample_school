module Web
  module Controllers
    module User
      class Update
        include Web::Action

        def call(params)


          name = params[:name]
          return status(400, {response: 'Bad input'}) unless name && !name.empty?

          department_id = params[:department_id]
          department = DepartmentRepository.get(department_id)
          return status(404, {response: 'Department not found'}) unless department

          role_id = params[:role_id]
          role = RoleRepository.get(role_id)
          return status(404, {response: 'Role not found'}.to_json) unless role

          user_id = params[:user_id]
          existing_user = UserRepository.get(user_id)
          return status(404, {response: 'User not found'}.to_json) unless existing_user

          user = UserRepository.update(user_id, name, department_id, role_id)

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
