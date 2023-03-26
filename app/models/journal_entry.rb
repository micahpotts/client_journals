class JournalEntry < ApplicationRecord
  belongs_to :clients, foreign_key: "clients_id", :class_name => "Client"

  scope :by_date_posted, -> { order(created_at: :asc) }
end
