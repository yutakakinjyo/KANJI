class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.string :detail
      t.integer :size
      t.references :user, index: true

      t.timestamps
    end
  end
end
