class CreateSchemas < ActiveRecord::Migration[7.1]
  def change
    execute "CREATE SCHEMA IF NOT EXISTS sales;"
    execute "CREATE SCHEMA IF NOT EXISTS hr_schema;"
  end
end