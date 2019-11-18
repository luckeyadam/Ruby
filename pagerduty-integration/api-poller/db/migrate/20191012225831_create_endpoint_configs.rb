class CreateEndpointConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :endpoint_configs do |t|
      t.string :url
      t.string :password_digest

      t.timestamps
    end
  end
end
