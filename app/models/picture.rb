# frozen_string_literal: true

# ## Schema Information
#
# Table name: `pictures`
#
# ### Columns
#
# Name                | Type               | Attributes
# ------------------- | ------------------ | ---------------------------
# **`created_at`**    | `datetime`         | `not null`
# **`description`**   | `text`             |
# **`id`**            | `bigint(8)`        | `not null, primary key`
# **`ski_route_id`**  | `bigint(8)`        | `indexed`
# **`updated_at`**    | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_pictures_on_ski_route_id`:
#     * **`ski_route_id`**
#

class Picture < ApplicationRecord
  has_one_attached :image
end
