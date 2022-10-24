require_relative '../lib/bookrepo.rb'

def reset_books_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BookRepo do
  before(:each) do 
    reset_books_table
  end

  it "returns a list of books" do
    repo = BookRepo.new
    books = repo.all
    expect(books.length).to eq 2
    expect(books[0].id).to eq '1'
    expect(books[0].title).to eq 'DWARVES'
    expect(books[0].author_name).to eq'Markus Heitz'
    expect(books[1].id).to eq '2'
    expect(books[1].title).to eq 'Harry Potter and the Goblet of Fire'
    expect(books[1].author_name).to eq 'J.K. Rowling'
  end
end