class CreateResources < ActiveRecord::Migration[6.1]
  def change
    create_table :resources do |t|
      t.string :source
      t.string :funding_name
      t.text :description
      t.string :amount
      t.string :contact_person
      t.string :web
      t.string :eligible
      t.string :deadline
      t.boolean :is_approved

      t.timestamps
    end
  end
end
