class CreatPeopleTable < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t| #cats is the name of the table
      #creating some columns
      t.string :name, null: false #null enforces every cat has a name
      t.integer :house_id, null: false
      t.timestamps
    end
  end
end
