class Client < ApplicationRecord
  has_many :journal_entries
  has_many :provider_assignments
  has_many :providers, through: :provider_assignments

  validates :email, presence: true
  validates :name, presence: true
end
