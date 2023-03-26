class AddClientToJournalEntry < ActiveRecord::Migration[7.0]
  def change
    add_reference :journal_entries, :clients, index: true, foreign_key: { to_table: :clients }
  end
end
