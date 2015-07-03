# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

group = ExamGroup.create(name: '数学')
Member.create(exam_group_id: group.id, name: '芥川 和雄', study: '微分幾何,幾何解析・大域解析')
