Question = require "./question"

describe "Question", ->
  question = {}
  beforeEach ->
    question_params =
      description: "Typ eens x = 1."
      answer: /x\s*=\s*1/
      possible_errors:
        wrong_value: /x\s*=\s*\d/
      error_messages:
        wrong_value: "Je hebt de verkeerde waarde toegewezen."
        default: "Dat is niet goed. Typte je x = 1?"

    question = new Question(question_params)

  it "knows its description", ->
    expect(question.description).toEqual "Typ eens x = 1."

  describe "Evaluating a command", ->
    it "knows if the answer is correct", ->
      question.evaluate("x = 1")
      expect(question.isRightAnswer).toEqual true

    it "gives an appropriate response if answer is incorrect", ->
      question.evaluate("x = 5")
      expect(question.isRightAnswer).toEqual false
      expect(question.error_message).toEqual "Je hebt de verkeerde waarde toegewezen."

    it "gives the default response if it can't match any common mistakes", ->
      question.evaluate("carrot")
      expect(question.error_message).toEqual "Dat is niet goed. Typte je x = 1?"

    it "updates its responses accordingly", ->
      question.evaluate("x = 5")
      question.evaluate("carrot")
      expect(question.error_message).toEqual "Dat is niet goed. Typte je x = 1?"