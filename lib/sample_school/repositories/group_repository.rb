class GroupRepository < Hanami::Repository
  associations do
    has_many :group_memberships
    has_many :users, through: :group_memberships
  end

  def find_with_users(group_id)
    aggregate(:users, group_memberships: :users)
        .where(group_id: group_id)
        .map_to(Group)
        .one
        .users
        .map do |u|
      {
          user_id: u.user_id,
          role_id: u.role_id,
          name: u.name
      }
    end
  end

  # @param [String] name
  # @param [Number] department_id
  # @return [GroupRepository]
  def self.insert(name, department_id)
    GroupRepository.new.create(name: name, department_id: department_id)
  end

  def self.update(group_id, name, department_id)
    GroupRepository.new.update(group_id, name: name, department_id: department_id)
  end

  # @param [Integer] group_id
  # @return [GroupRepository]
  def self.get(group_id)
    GroupRepository.new.find(group_id)
  end

  # @param [Integer] group_id
  # @return [Boolean]
  def self.delete(group_id)
    GroupRepository.new.delete(group_id)
  end
end
