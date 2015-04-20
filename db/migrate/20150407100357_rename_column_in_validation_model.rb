class RenameColumnInValidationModel < ActiveRecord::Migration
  def change
  	rename_column :validations, :word_image_link, :word_image_url
  end
end
