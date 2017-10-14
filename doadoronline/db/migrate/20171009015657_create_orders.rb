class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :nome
      t.date :dtanascimento
      t.string :telefone
      t.string :email
      t.date :dtaagendada
      t.string :doador
      t.string :tpsanguineo

      t.timestamps
    end
  end
end
