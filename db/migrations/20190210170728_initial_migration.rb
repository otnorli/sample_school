Hanami::Model.migration do
  up do
    create_table :departments do
      primary_key :department_id

      String :name, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end

    create_table :groups do
      # In practice a group at a department will in practice likely require:
      # * Link to a course table - for example Biologi (one course many groups)
      # * Link to a department year - for exmaple 2018/2019 (one department year many groups)
      # * Column Class letter - for example group A

      # In total this would give: Class A for Biologi 2017/2018 at a given department
      # which would make the "name" column is likely redudant - except for this demo
      # Similar simplifications on other tables
      primary_key :group_id

      foreign_key :department_id, :departments, null: false
      String :name, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end

    create_table :roles do
      primary_key :role_id

      String :name, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end

    create_table :users do
      primary_key :user_id

      foreign_key :department_id, :departments, null: false
      foreign_key :role_id, :roles, null: false
      String :name, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end

    create_table :group_memberships do
      # Primary key on this table not necasarily needed in this case
      primary_key :group_membership_id

      foreign_key :group_id, :groups, null: false
      foreign_key :user_id, :users, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      unique [:group_id, :user_id]
    end
  end

  down do
    drop_table(:group_memberships)
    drop_table(:users)
    drop_table(:roles)
    drop_table(:groups)
    drop_table(:departments)
  end
end
