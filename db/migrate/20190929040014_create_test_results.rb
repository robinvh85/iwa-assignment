class CreateTestResults < ActiveRecord::Migration[6.0]
  def change
    create_table :test_results do |t|
      t.references :user
      t.references :question
      t.references :option

      t.timestamps
    end
  end
end
