class CreateMembershipInvitations < ActiveRecord::Migration
  def self.up
    create_table :membership_invitations do |t|
      t.integer :user_id
      t.integer :group_id
      t.integer :admin_id
      t.timestamps
    end
  end

  def self.down
    drop_table :membership_invitations
  end
end
