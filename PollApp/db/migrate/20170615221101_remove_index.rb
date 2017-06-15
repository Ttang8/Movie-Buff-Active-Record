class RemoveIndex < ActiveRecord::Migration[5.0]
  def change
    remove_column :answer_choices, :question_id
    add_column :answer_choices, :question_id, :integer 
  end
end
