require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create!(chefname: "yuki", email: "yuki@gmail.com")
    @recipe = @chef.recipes.build(name: "vegetable", description: "great vegetable recipe")
  end

  test "recipe without chef should be invalid" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "recipe should be presence" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "description should be presence" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end

  test "description shouldn't be less than 5 characters" do
    @recipe.description = "a" * 3
    assert_not @recipe.valid?
  end

  test "description shouldn't be more than 500 characters" do
    @recipe.description = "a" * 555
    assert_not @recipe.valid?
  end
end
