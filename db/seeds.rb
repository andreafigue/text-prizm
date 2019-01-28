# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Code.create(name: "anger", color: "#FC5C56")
Code.create(name: "anticipation", color: "#FFB05C")
Code.create(name: "joy", color: "#FFE663")
Code.create(name: "trust", color: "#B5FC68")
Code.create(name: "fear", color: "#41DB8A")
Code.create(name: "surprise", color: "#3CE8FF")
Code.create(name: "sadness", color: "#519DFC")
Code.create(name: "disgust", color: "#B563FB")
Code.create(name: "no emotion", color: "gray")
Code.create(name: "unknown", color: "#00000")

Topic.create(name: "Opinions about Zuckerberg in scandal", icon: "play")
Topic.create(name: "Facts & Opinions about CA Scandal", icon: "star")
Topic.create(name: "Facts & Opinions about Mark Zuckerberg hearings", icon: "stop")
Topic.create(name: "Repercussions of CA Scandal", icon: "heart")
Topic.create(name: "Actionable information to react to privacy breaches", icon: "moon")
Topic.create(name: "Political Facts & Opinions related to the CA scandal", icon: "codepen")
Topic.create(name: "Facts & Opinions about new data privacy breaches", icon: "diamond")
Topic.create(name: "Zuckerbergs & FB responsibility with data privacy", icon: "feather")
Topic.create(name: "Facebooks involvement or interest in other entities", icon: "comment")
Topic.create(name: "Technology & data regulation", icon: "flag")
Topic.create(name: "Actions organizations take in response to the scandal", icon: "tiled")
Topic.create(name: "Thoughts about implications of data privacy breaches", icon: "artboard")
Topic.create(name: "Unknown", icon: "question")
Topic.create(name: "Irrelevant", icon: "warning")