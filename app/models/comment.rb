# frozen_string_literal: true

# ## Schema Information
#
# Table name: `comments`
#
# ### Columns
#
# Name                | Type               | Attributes
# ------------------- | ------------------ | ---------------------------
# **`content`**       | `text`             | `not null`
# **`created_at`**    | `datetime`         | `not null`
# **`id`**            | `bigint(8)`        | `not null, primary key`
# **`ski_route_id`**  | `bigint(8)`        | `indexed`
# **`updated_at`**    | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_comments_on_ski_route_id`:
#     * **`ski_route_id`**
#


class Comment < ApplicationRecord
  belongs_to :ski_route

  validates :content, presence: true
end
