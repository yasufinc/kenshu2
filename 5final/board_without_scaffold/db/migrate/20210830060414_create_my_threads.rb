class CreateMyThreads < ActiveRecord::Migration[6.1]
  def change
    create_table :my_threads do |t|
      t.string :title

      t.timestamps
    end
  end
end
