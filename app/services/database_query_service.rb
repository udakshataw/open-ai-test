class DatabaseQueryService
    VALID_SCHEMAS = { "employees" => "hr_schema", "orders" => "sales" } # Define mappings
  
    def self.query(sql)
      begin
        # Extract table name
        table_match = sql.match(/FROM\s+([a-zA-Z0-9_]+)/i)
        table_name = table_match[1] if table_match
  
        # Append schema if missing
        if table_name && !sql.include?(".")
          schema = VALID_SCHEMAS[table_name]
          if schema
            sql.sub!("FROM #{table_name}", "FROM #{schema}.#{table_name}")
          else
            return { error: "Invalid table: #{table_name}" }
          end
        end
        
        result = ActiveRecord::Base.connection.execute(sql)
        puts "---->>>> Database Query service result: #{result}"
        result.to_a
      rescue => e
        { error: "SQL Execution Error: #{e.message}" }
      end
    end
  end
  