# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id, inverse_of: :posts

  validates :title, :body, presence: true
end
