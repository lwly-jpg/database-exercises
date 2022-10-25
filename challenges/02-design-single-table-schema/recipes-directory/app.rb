require_relative 'lib/database_connection'

DatabaseConnection.connect('recipes_directory')

sql = 'SELECT id, name, average_cooking_time, rating FROM recipes;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
result.each do |record|
  p "#{record['id']} - #{record['name']} - Avg. Cooking Time: #{record['average_cooking_time']} mins - Rating #{record['rating']} / 5"
end