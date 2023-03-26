class AddIndexToProviders < ActiveRecord::Migration[7.0]
  def change
    add_index :providers, :email, unique: true
  end
end
