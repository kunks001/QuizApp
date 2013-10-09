class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :query
      t.belongs_to :quiz, index: true

      t.timestamps
    end
  end
end
