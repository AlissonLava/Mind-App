class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
# estava causando um erro ao executar o camando 'rails db:migrate'...

# == 20210402234253 CreateContents: migrating ===================================
# -- create_table(:contents)
# rails aborted!
# StandardError: An error has occurred, this and all later migrations canceled:

# SQLite3::SQLException: table "contents" already exists
# /mnt/d/aliss/Programação/Ruby/mind-app/db/migrate/20210402234253_create_contents.rb:3:in `change'
# /mnt/d/aliss/Programação/Ruby/mind-app/bin/rails:5:in `<top (required)>'
# /mnt/d/aliss/Programação/Ruby/mind-app/bin/spring:10:in `block in <top (required)>'
# /mnt/d/aliss/Programação/Ruby/mind-app/bin/spring:7:in `<top (required)>'

# Caused by:
# ActiveRecord::StatementInvalid: SQLite3::SQLException: table "contents" already exists
# /mnt/d/aliss/Programação/Ruby/mind-app/db/migrate/20210402234253_create_contents.rb:3:in `change'
# /mnt/d/aliss/Programação/Ruby/mind-app/bin/rails:5:in `<top (required)>'
# /mnt/d/aliss/Programação/Ruby/mind-app/bin/spring:10:in `block in <top (required)>'
# /mnt/d/aliss/Programação/Ruby/mind-app/bin/spring:7:in `<top (required)>'

# Caused by:
# SQLite3::SQLException: table "contents" already exists
# /mnt/d/aliss/Programação/Ruby/mind-app/db/migrate/20210402234253_create_contents.rb:3:in `change'
# /mnt/d/aliss/Programação/Ruby/mind-app/bin/rails:5:in `<top (required)>'
# /mnt/d/aliss/Programação/Ruby/mind-app/bin/spring:10:in `block in <top (required)>'
# /mnt/d/aliss/Programação/Ruby/mind-app/bin/spring:7:in `<top (required)>'
# Tasks: TOP => db:migrate
# (See full trace by running task with --trace)