class AddAuthenticationTokenToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :authentication_token, :string
  end
end
