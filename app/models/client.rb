class Client < ApplicationRecord
  has_many :journal_entries
  has_many :provider_assignments
  has_many :providers, through: :provider_assignments

  validates :email, presence: true
  validates :name, presence: true
  validates :plan, inclusion: { in: %w(basic premium),
    message: "%{value} is not a valid plan" }
end
