module Web
  module Controllers
    module Role
      class Users
        include Web::Action

        def call(params)
          role_id = params[:role_id]
          role = RoleRepository.get(role_id)
          return status(404, {response: 'Role not found'}.to_json) unless role
          users = UserRepository.new.by_role(role_id)

          response = {
              role: {
                  users: users,
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
