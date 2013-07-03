require 'test_helper'

class CommitsControllerTest < ActionController::TestCase
  setup do
    @commit = commits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commit" do
    assert_difference('Commit.count') do
      post :create, commit: { author_date: @commit.author_date, author_id: @commit.author_id, author_login: @commit.author_login, committer_email: @commit.committer_email, committer_name: @commit.committer_name, html_url: @commit.html_url, project_id: @commit.project_id, sha: @commit.sha }
    end

    assert_redirected_to commit_path(assigns(:commit))
  end

  test "should show commit" do
    get :show, id: @commit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commit
    assert_response :success
  end

  test "should update commit" do
    put :update, id: @commit, commit: { author_date: @commit.author_date, author_id: @commit.author_id, author_login: @commit.author_login, committer_email: @commit.committer_email, committer_name: @commit.committer_name, html_url: @commit.html_url, project_id: @commit.project_id, sha: @commit.sha }
    assert_redirected_to commit_path(assigns(:commit))
  end

  test "should destroy commit" do
    assert_difference('Commit.count', -1) do
      delete :destroy, id: @commit
    end

    assert_redirected_to commits_path
  end
end
