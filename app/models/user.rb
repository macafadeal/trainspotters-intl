# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :trains, dependent: :destroy

  validate :password_complexity, if: -> { password.present? }

  private

  def password_complexity
    return if password.match?(/\A(?=.*[a-zA-Z])(?=.*\d).+\z/)

    errors.add(:password, "must include at least one letter and one number")
  end
end
