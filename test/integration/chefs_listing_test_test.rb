require 'test_helper'

class ChefsListingTestTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: "yuki", email: "yuki@gmail.com",
                         password: "password", password_confirmation: "password")
    @chef2 = Chef.create!(chefname: "yuki2", email: "yuki2@gmail.com",
                                               password: "password", password_confirmation: "password")
  end

  test "should get chefs listing" do
    get chefs_path
    assert_template 'chefs/index'
    assert_select "a[href=?]", chef_path(@chef), test: @chef.chefname.capitalize
    assert_select "a[href=?]", chef_path(@chef2), test: @chef2.chefname.capitalize
  end

  test "should delete chef" do
    sign_in_as(@chef, "password")
    get chefs_path
    assert_template 'chefs/index'
    assert_difference 'Chef.count', -1 do
      delete chef_path(@chef)
    end
    assert_redirected_to chefs_path
    assert_not flash.empty?
  end
end
