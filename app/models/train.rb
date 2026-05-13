# frozen_string_literal: true

class Train < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :manufacturer, :series, :main_operator,
    presence: true,
    length: {maximum: 255}

  validates :photo,
    content_type: {
      in: %w[image/jpeg image/png image/webp image/gif],
      message: "must be a JPEG, PNG, WebP, or GIF"
    },
    size: {less_than: 10.megabytes, message: "must be less than 10 MB"}
end
