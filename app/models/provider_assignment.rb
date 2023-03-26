class ProviderAssignment < ApplicationRecord
  belongs_to :client
  belongs_to :provider
end
