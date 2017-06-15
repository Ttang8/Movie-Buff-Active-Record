class CreateAnswerChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_choices do |t|
      t.integer :question_id, null:false
      t.text :text, null:false
      t.integer :user_id
      t.timestamps
    end
    add_index :answer_choices, :user_id, unique: true
    add_index :answer_choices, :question_id, unique: true
  end
end
