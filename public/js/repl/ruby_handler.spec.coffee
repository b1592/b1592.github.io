Question = require "./question"
Lesson = require "./lesson"
RubyHandler = require "./ruby_handler"

describe "RubyHandler", ->

  MOCK_STDOUT = mockEngine = mockOutput = rubyHandler = lesson = questionParams = question = outputHandlers = null 
  beforeEach ->
    # Poor man's stdout testing:
    #
    # The engine and output function do not need to be tested.
    # We mock them here to simplify the testing of the ruby_handler class.
    # The mock output function appends its argument to MOCK_STDOUT (a string),
    # which is checked for correct output.
    MOCK_STDOUT = ""
    mockEngine =
      initialize: ->
      eval: (command) -> "bytecode"
      stringify: (bytecode) -> "ruby output"
    mockOutput = (string) -> MOCK_STDOUT += string
    questionParams =
      description: "Typ eens x = 1."
      answer: /x\s*=\s*1/
      possible_errors:
        wrong_value: /x\s*=\s*\d/
      error_messages:
        wrong_value: "Je hebt de verkeerde waarde toegewezen."
        default: "Dat is niet goed. Typte je x = 1?"
    question = new Question(questionParams)
    lesson = new Lesson([question])
    # Use mock output for result, output, error and lesson output handling
    outputHandlers = 
      output: mockOutput
      result: mockOutput
      error: mockOutput
      lesson: mockOutput
    rubyHandler = new RubyHandler(outputHandlers, mockEngine, lesson)

  it "outputs the lesson description immediately", ->
    expect(MOCK_STDOUT).toEqual "Typ eens x = 1."
