module Web
  module Controllers
    module User
      class Show
        include Web::Action

        def call(params)
          user_id = params[:user_id]
          user = UserRepository.get(user_id)
          return status(404, {response: 'User not found'}.to_json) unless user

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
