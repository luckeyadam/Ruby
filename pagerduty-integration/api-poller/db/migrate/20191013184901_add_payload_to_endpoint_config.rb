class AddPayloadToEndpointConfig < ActiveRecord::Migration[5.2]
  def change
    add_column :endpoint_configs, :payload, :string
  end
end
