class CreateJoinTablePlanUser < ActiveRecord::Migration
  def change
    create_join_table :plans, :users do |t|
      t.index [:plan_id, :user_id]
      t.index [:user_id, :plan_id]
    end
  end
end
