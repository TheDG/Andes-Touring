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
# **`sector`**             | `string`           |
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
                 La-Parva LagunillasSkiCenter Llaima Chillan Portillo
                 PowderSouthHeliski PumaLodge Arpa Valle-Nevado VillarricaPucon VolcanOsorno].freeze

  ASPECTS = %w[N NE E SE S SW W NW].freeze

  SECTORS = { valpo: 'Valparaíso', rm: 'RM', higgins: "O'Higgins", maule: 'Maule',
              nuble: 'Ñuble', bio: 'Biobío', arauca: 'Araucanía', rios: 'Los Ríos',
              lagos: 'Los Lagos', aysen: 'Aysén' }.freeze

  belongs_to :user
  has_many :comments
  has_many :pictures
  has_one_attached :avatar
end
