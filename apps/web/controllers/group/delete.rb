module Web
  module Controllers
    module Group
      class Delete
        include Web::Action

        def call(params)
          group_id = params[:group_id]
          group = GroupRepository.get(group_id)
          return status(404, {response: 'Group not found'}) unless group
          GroupRepository.delete(group_id)
          response = { response: 'OK' }
          status(200, response.to_json)
        end
      end
    end
  end
end
