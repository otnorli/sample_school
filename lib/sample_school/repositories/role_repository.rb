class RoleRepository < Hanami::Repository
  # @param [String] name
  # @return [RoleRepository]
  def self.insert(name)
    RoleRepository.new.create(name: name)
  end

  # @param [Integer] role_id
  # @return [RoleRepository]
  def self.get(role_id)
    RoleRepository.new.find(role_id)
  end

  # @param [Integer] school_id
  # @return [Boolean]
  def self.delete(role_id)
    RoleRepository.new.delete(role_id)
  end

  def self.update(role_id, name)
    RoleRepository.new.update(role_id, name: name)
  end
end
