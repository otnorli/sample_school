module Web
  module Controllers
    module Role
      class Delete
        include Web::Action

        def call(params)
          role_id = params[:role_id]
          role = RoleRepository.get(role_id)
          return status(404, {response: 'Role not found'}.to_json) unless role
          RoleRepository.delete(role_id)
          response = { response: 'OK' }
          status(200, response.to_json)
        end
      end
    end
  end
end
