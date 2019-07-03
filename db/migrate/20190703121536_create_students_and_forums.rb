class CreateStudentsAndForums < ActiveRecord::Migration[5.2]
  def change
    
    create_table :students do |t|
      t.string :name
      t.timestamps
    end

    create_table :forums do |t|
      t.string :name
      t.timestamps
    end

    create_table :students_forums, id: false do |t|
      t.belongs_to :student, index: true
      t.belongs_to :forum, index: true
    end

  end
end
