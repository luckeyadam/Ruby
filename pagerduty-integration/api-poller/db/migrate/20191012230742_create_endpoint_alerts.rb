class CreateEndpointAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :endpoint_alerts do |t|
      t.string :identifier
      t.string :title
      t.string :description
      t.string :status
      t.references :endpoint_config, foreign_key: true

      t.timestamps
    end
  end
end
