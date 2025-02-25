class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table "hr_schema.employees" do |t|
      t.string :name
      t.string :department

      t.timestamps
    end
  end
end
