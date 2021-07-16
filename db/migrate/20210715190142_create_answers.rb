class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.belongs_to :question
      t.boolean :correct
      t.text :option
      t.text :explanation

      t.timestamps
    end
  end
end
