# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test 'should get index' do
    get posts_path
    assert_response :success
  end

  test 'should get new' do
    get new_post_path
    assert_response :success
  end

  test 'should get show' do
    get post_path(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_path(@post)
    assert_response :success
  end

  test 'should create post' do
    attrs = {
      title: 'Title',
      body: 'Body'
    }

    post posts_path, params: { post: attrs }

    post = Post.find_by(title: attrs[:title])

    assert post
    assert_redirected_to post_path(post)
  end

  test 'should update post' do
    attrs = {
      title: 'New Title'
    }

    patch post_path(@post), params: { post: attrs }

    assert_redirected_to post_path(@post)
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_path(@post)
    end

    assert_redirected_to posts_path
  end
end