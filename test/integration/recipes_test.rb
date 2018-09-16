require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: "yuki", email: "yuki@gmail.com")
    @recipe = Recipe.create(name: "vegetable", description: "great vegetable", chef: @chef)
    @recipe2 = @chef.recipes.build(name: "chicken saute", description: "good taste")
    @recipe2.save
  end

  test "should get recipes index" do
    get recipes_path
    # assert_response :success
  end

  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end



end
