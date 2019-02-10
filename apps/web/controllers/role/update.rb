module Web
  module Controllers
    module Role
      class Update
        include Web::Action

        def call(params)
          name = params[:name]
          return status(400, {response: 'Bad input'}) unless name && !name.empty?
          role_id = params[:role_id]
          existing_role = RoleRepository.get(role_id)
          return status(404, {response: 'Role not found'}.to_json) unless existing_role
          role = RoleRepository.update(role_id, name)

          response = {
              role: {
                  name: role.name,
                  role_id: role.role_id
              }
          }

          status(200, response.to_json)
        end
      end
    end
  end
end
