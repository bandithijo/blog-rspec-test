class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :full_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
