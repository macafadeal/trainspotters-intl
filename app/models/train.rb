# frozen_string_literal: true

class Train < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
end
