class Provider < ApplicationRecord
  has_many :provider_assignments
  has_many :clients, through: :provider_assignments

  validates :name, presence: true
  validates :email, presence: true
end
