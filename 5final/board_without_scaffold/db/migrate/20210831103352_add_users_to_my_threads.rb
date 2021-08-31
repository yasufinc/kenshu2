class AddUsersToMyThreads < ActiveRecord::Migration[6.1]
  def change
    add_reference :my_threads, :user
  end
end
