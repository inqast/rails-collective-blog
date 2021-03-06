# frozen_string_literal: true

class PostLike < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true

  validates :post, uniqueness: { scope: :user_id }
end
