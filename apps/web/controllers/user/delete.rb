module Web
  module Controllers
    module User
      class Delete
        include Web::Action

        def call(params)
          user_id = params[:user_id]
          user = UserRepository.get(user_id)
          return status(404, {response: 'User not found'}.to_json) unless user
          UserRepository.delete(user_id)
          response = { response: 'OK' }
          status(200, response.to_json)
        end
      end
    end
  end
end
