class CreateEncrypteds < ActiveRecord::Migration[5.1]
  def change
    create_table :encrypteds do |t|
      t.string :message

      t.timestamps
    end
  end
end
