require_relative 'lib/database_connection'

DatabaseConnection.connect('book_store_test')

result = DatabaseConnection.exec_params('SELECT * FROM books;', [])

result.each do |record|
  p "#{record['id']} - #{record['title']} - #{record['author_name']}"
end