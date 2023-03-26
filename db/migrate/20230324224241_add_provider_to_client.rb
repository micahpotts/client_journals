class AddProviderToClient < ActiveRecord::Migration[7.0]
  def change
    add_reference :clients, :providers, index: true, foreign_key: { to_table: :providers }
  end
end
