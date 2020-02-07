require 'test_helper'

class BooklistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get booklists_index_url
    assert_response :success
  end

  test "should get show" do
    get booklists_show_url
    assert_response :success
  end

  test "should get new" do
    get booklists_new_url
    assert_response :success
  end

  test "should get edit" do
    get booklists_edit_url
    assert_response :success
  end

  test "should get create" do
    get booklists_create_url
    assert_response :success
  end

  test "should get destroy" do
    get booklists_destroy_url
    assert_response :success
  end

end
