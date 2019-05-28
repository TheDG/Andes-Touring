# frozen_string_literal: true

# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                          | Type               | Attributes
# ----------------------------- | ------------------ | ---------------------------
# **`created_at`**              | `datetime`         | `not null`
# **`current_sign_in_at`**      | `datetime`         |
# **`current_sign_in_ip`**      | `inet`             |
# **`email`**                   | `string`           | `default(""), not null, indexed`
# **`encrypted_password`**      | `string`           | `default(""), not null`
# **`full_name`**               | `string`           |
# **`id`**                      | `bigint(8)`        | `not null, primary key`
# **`last_sign_in_at`**         | `datetime`         |
# **`last_sign_in_ip`**         | `inet`             |
# **`provider`**                | `string`           |
# **`remember_created_at`**     | `datetime`         |
# **`reset_password_sent_at`**  | `datetime`         |
# **`reset_password_token`**    | `string`           | `indexed`
# **`sign_in_count`**           | `integer`          | `default(0), not null`
# **`uid`**                     | `string`           |
# **`updated_at`**              | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_users_on_email` (_unique_):
#     * **`email`**
# * `index_users_on_reset_password_token` (_unique_):
#     * **`reset_password_token`**
#
require 'open-uri'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_one_attached :avatar
  has_many :ski_routes

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name
    end
    file = open(auth.info.image)
    user.avatar.attach(io: file, filename: 'avatar.jpg')
    user
  end
end
