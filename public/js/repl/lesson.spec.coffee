Lesson = require "./lesson.coffee"

describe "Lesson", ->
  lesson = question1 = question2 = null
  beforeEach ->
    question1 = 
      description: "question 1"
    question2 = 
      description: "question 2"
    lesson = new Lesson([question1, question2])

  it "starts with the first question", ->
    expect( lesson.currentQuestion() ).toEqual question1

  it "knows which question it's at", ->
    lesson.next()
    expect( lesson.currentQuestion() ).toEqual question2

  it "knows when it's done", ->
    expect( lesson.isDone ).toEqual false
    lesson.next()
    expect( lesson.isDone ).toEqual false
    lesson.next()
    expect( lesson.isDone ).toEqual true

  it "doesn't go past the final question", ->
    lesson.next()
    lesson.next()
    expect( lesson.currentQuestion() ).toEqual question2


