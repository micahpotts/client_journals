class CreateProviderAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :provider_assignments do |t|
      t.references :client, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
