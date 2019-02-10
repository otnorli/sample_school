class GroupMembershipRepository < Hanami::Repository

  associations do
    belongs_to :group
    belongs_to :user
  end

  # @param [Integer] group_id
  # @param [Integer] user_id
  # @return [GroupMembershipRepository]
  def self.insert(user_id, group_id)
    GroupMembershipRepository.new.create(group_id: group_id, user_id: user_id)
  end

  def self.update(group_membership_id, user_id, group_id)
    GroupMembershipRepository.new.update(group_membership_id, group_id: group_id, user_id: user_id)
  end

  # @param [Integer] user_id
  # @return [GroupMembershipRepository]
  def self.get(user_id)
    GroupMembershipRepository.new.find(user_id)
  end

  # @param [Integer] class_id
  # @return [Boolean]
  def self.delete(user_id)
    GroupMembershipRepository.new.delete(user_id)
  end

  def existing_membership(user_id, group_id)
    group_memberships.where(user_id: user_id, group_id: group_id).limit(1).first
  end
end
