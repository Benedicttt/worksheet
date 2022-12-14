class AddTypeChiks < ActiveRecord::Migration[7.0]
  def up
    add_column :count_chicks, :type_animal, :string
  end

  def down
    remove_column :count_chicks, :type_animal
  end
end
