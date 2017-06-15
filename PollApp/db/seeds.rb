# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

user1 = User.create!(user_name:"Howard")
user2 = User.create!(user_name:"Terrence")
user3 = User.create!(user_name:"Andrew")

poll1 = Poll.create!(user_id: user1.id, title:"Polls stuff")
poll2 = Poll.create!(user_id: user2.id, title:"Not polls stuff")

question1 = Question.create!(poll_id: poll1.id, text:"What is life?")
question2 = Question.create!(poll_id: poll2.id, text:"What is death?")

answerchoice1 = AnswerChoice.create!(question_id: question1.id, text:"Life if meangingful.")
answerchoice2 = AnswerChoice.create!(question_id: question2.id, text:"Death sucks")


response1 = Response.create!(user_id: user2.id, answer_choice_id: answerchoice1.id )
response2 = Response.create!(user_id: user1.id, answer_choice_id: answerchoice2.id )
