# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fix = Task.create! name: 'Fix'
new_function = Task.create! name: 'New function'

fix.subtasks.create! name: 'UI'
fix.subtasks.create! name: 'Logic'
fix.subtasks.create! name: 'Model'
fix.subtasks.create! name: 'Database'

new_function.subtasks.create! name: 'Extension'
new_function.subtasks.create! name: 'New function'
