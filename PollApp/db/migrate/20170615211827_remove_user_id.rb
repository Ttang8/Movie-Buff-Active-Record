class RemoveUserId < ActiveRecord::Migration[5.0]
  def change
    remove_column :answer_choices, :user_id
  end
end
