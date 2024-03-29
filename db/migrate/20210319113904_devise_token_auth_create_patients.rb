# frozen_string_literal: true

class DeviseTokenAuthCreatePatients < ActiveRecord::Migration[6.0] # rubocop:todo Style/Documentation
  def change # rubocop:todo Metrics/MethodLength
    create_table(:patients) do |t|
      ## Required
      t.string :provider, null: false, default: 'email'
      t.string :uid, null: false, default: ''

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, default: false

      ## Patient Info
      t.string :last_name
      t.string :first_name
      t.string :email

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :patients, :email, unique: true
    add_index :patients, %i[uid provider], unique: true
    add_index :patients, :reset_password_token, unique: true
  end
end
