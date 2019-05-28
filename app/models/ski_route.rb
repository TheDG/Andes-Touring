# frozen_string_literal: true

# ## Schema Information
#
# Table name: `ski_routes`
#
# ### Columns
#
# Name                     | Type               | Attributes
# ------------------------ | ------------------ | ---------------------------
# **`aspect`**             | `string`           |
# **`created_at`**         | `datetime`         | `not null`
# **`dificulty`**          | `integer`          |
# **`distance`**           | `integer`          |
# **`id`**                 | `bigint(8)`        | `not null, primary key`
# **`intro`**              | `text`             |
# **`location`**           | `string`           |
# **`route_description`**  | `text`             |
# **`time`**               | `integer`          |
# **`title`**              | `string`           |
# **`updated_at`**         | `datetime`         | `not null`
# **`user_id`**            | `bigint(8)`        | `indexed`
# **`vert`**               | `integer`          |
#
# ### Indexes
#
# * `index_ski_routes_on_user_id`:
#     * **`user_id`**
#

class SkiRoute < ApplicationRecord
  LOCATIONS = %w[AltodelPadre Antillanca Antuco CerroMirador Chapa-Verde
                 Lonquimay El-Colorado ElFraile Farellones Huilo-Huilo-Snow-Center
                 LaParva LagunillasSkiCenter Llaima Chillan Portillo
                 PowderSouthHeliski PumaLodge Arpa Valle-Nevado VillarricaPucon VolcanOsorno].freeze

  ASPECTS = %w[N NE E SE S SW W NW].freeze

  belongs_to :user
end
