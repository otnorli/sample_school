module Web
  module Controllers
    module Role
      class Create
        include Web::Action

        def call(params)
          name = params[:name]
          return status(400, {response: 'Bad input'}) unless name && !name.empty?
          role = RoleRepository.insert(name)

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
