# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

survey = Survey.create(name: 'Survey 1')
question1 = Question.create(
  title: 'How was your experience with us today?',
  question_type: :choice,
  survey: survey
)

Option.create(title: 'Very Good', question: question1)
Option.create(title: 'Good', question: question1)
Option.create(title: 'Neutral', question: question1)
Option.create(title: 'Bad', question: question1)
Option.create(title: 'Very Bad', question: question1)

Question.create(
  title: 'Please explain the reason for your choice.',
  question_type: :text,
  survey: survey
)
