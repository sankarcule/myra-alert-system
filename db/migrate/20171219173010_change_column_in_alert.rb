class ChangeColumnInAlert < ActiveRecord::Migration[5.1]
  def change
    change_column :alerts, :reference_id, :string
  end
end
