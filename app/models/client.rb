class Client < ApplicationRecord
  belongs_to :providers, foreign_key: "providers_id", :class_name => "Provider"
  has_many :journal_entries
end
