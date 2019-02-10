class UserRepository < Hanami::Repository
  associations do
    has_many :groups
  end

  # @param [String] name
  # @param [Number] department_id
  # @param [Number] role_id
  # @return [UserRepository]
  def self.insert(name, department_id, role_id)
    UserRepository.new.create(name: name, department_id: department_id, role_id: role_id)
  end

  def self.update(user_id, name, department_id, role_id)
    UserRepository.new.update(user_id, name: name, department_id: department_id, role_id: role_id)
  end

  # @param [Integer] user_id
  # @return [UserRepository]
  def self.get(user_id)
    UserRepository.new.find(user_id)
  end

  # @param [Integer] class_id
  # @return [Boolean]
  def self.delete(user_id)
    UserRepository.new.delete(user_id)
  end

  def by_role(role_id)
    users.where(role_id: role_id).map do |user|
      {
          name: user[:name],
          role_id: user[:role_id],
          department_id: user[:department_id]
      }
    end
  end

  def by_department(department_id)
    users.where(department_id: department_id).map do |user|
      {
          name: user[:name],
          role_id: user[:role_id],
          department_id: user[:department_id]
      }
    end
  end
end
