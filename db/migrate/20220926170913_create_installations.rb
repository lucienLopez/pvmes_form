class CreateInstallations < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name, index: true
      t.string :siren, index: true

      t.timestamps
    end

    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end

    create_table :installations do |t|
      t.references :company, foreign_key: true
      t.references :customer, foreign_key: true

      t.string :address
      t.date :date, index: true
      t.integer :panels_count

      t.timestamps
    end

    create_table :panels do |t|
      t.references :installation, foreign_key: true

      t.integer :type
      t.string :code, index: true

      t.timestamps
    end
  end
end
