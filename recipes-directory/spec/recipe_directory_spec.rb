require 'recipe_directory'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  it 'returns list of all recipes' do
    repo = RecipeRepository.new
    recipes = repo.all
    expect(recipes.length).to eq 2
    expect(recipes[0].id).to eq "1"
    expect(recipes[0].name).to eq 'Toad in the hole'
    expect(recipes[0].average_cooking_time).to eq '50'
    expect(recipes[0].rating).to eq '5'
    expect(recipes[1].id).to eq "2"
    expect(recipes[1].name).to eq 'Fried chicken'
    expect(recipes[1].average_cooking_time).to eq '20'
    expect(recipes[1].rating).to eq '3'
  end

  it 'returns Toad in the hole recipe' do
    repo = RecipeRepository.new
    recipe = repo.find(1)
    expect(recipe.id).to eq "1"
    expect(recipe.name).to eq 'Toad in the hole'
    expect(recipe.average_cooking_time).to eq '50'
    expect(recipe.rating).to eq '5'
  end

  it 'returns Fried chicken recipe' do
    repo = RecipeRepository.new
    recipe = repo.find(2)
    expect(recipe.id).to eq "2"
    expect(recipe.name).to eq 'Fried chicken'
    expect(recipe.average_cooking_time).to eq '20'
    expect(recipe.rating).to eq '3'
  end
end