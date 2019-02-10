class DepartmentRepository < Hanami::Repository
  # @param [String] name
  # @return [DepartmentRepository]
  def self.insert(name)
    DepartmentRepository.new.create(name: name)
  end

  # @param [Integer] department_id
  # @return [DepartmentRepository]
  def self.get(department_id)
    DepartmentRepository.new.find(department_id)
  end

  # @param [Integer] department_id
  # @return [Boolean]
  def self.delete(department_id)
    DepartmentRepository.new.delete(department_id)
  end

  def self.update(department_id, name)
    DepartmentRepository.new.update(department_id, name: name)
  end
end
