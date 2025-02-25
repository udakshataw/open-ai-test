# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'active_record'

ActiveRecord::Base.connection.execute("INSERT INTO hr_schema.employees (name, department, created_at, updated_at) VALUES ('John Doe', 'Engineering', NOW(), NOW())")
ActiveRecord::Base.connection.execute("INSERT INTO sales.orders (product_name, price, created_at, updated_at) VALUES ('Laptop', 1200.50, NOW(), NOW())")
