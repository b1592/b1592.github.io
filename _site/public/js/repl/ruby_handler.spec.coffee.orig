Question = require "./question.coffee"
Lesson = require "./lesson.coffee"
RubyHandler = require "./ruby_handler.coffee"

describe "RubyHandler", ->

  MOCK_STDOUT = mockEngine = mockOutput = rubyHandler = lesson = questionParams = question = outputHandlers = null 
  beforeEach ->
    # Poor man's stdout testing:
    #
    # The engine and output function do not need to be tested.
    # We mock them here to simplify the testing of the ruby_handler class.
    # The mock output function appends its argument to MOCK_STDOUT (a string),
    # which is checked for correct output.
    MOCK_STDOUT = []
    mockEngine =
      initialize: ->
      eval: (command) -> "bytecode"
      stringify: (bytecode) -> "ruby output"
    mockOutput = (string) -> MOCK_STDOUT.push(string)
    questionParams =
      description: "Typ eens x = 1."
      answer: /x\s*=\s*1/
      possible_errors:
        wrong_value: /x\s*=\s*\d/
      error_messages:
        wrong_value: "Je hebt de verkeerde waarde toegewezen."
        default: "Dat is niet goed. Typte je x = 1?"
    question = new Question(questionParams)
    lesson = new Lesson([question, question])
    # Use mock output for result, output, error and lesson output handling
    outputHandlers = 
      output: mockOutput
      result: mockOutput
      error: mockOutput
      lesson: mockOutput
    rubyHandler = new RubyHandler(outputHandlers, mockEngine, lesson)

  it "outputs the lesson description immediately", ->
    expect(MOCK_STDOUT.join(" ")).toEqual "Typ eens x = 1."

  it "outputs both the ruby command and error response if wrong answer", ->
    MOCK_STDOUT = []
    rubyHandler.Eval("hallo")
    expect(MOCK_STDOUT.join(" ")).toEqual "ruby output Dat is niet goed. Typte je x = 1?"

  it "outputs the ruby command and description of the next question if right answer", ->
    MOCK_STDOUT = []
    rubyHandler.Eval("x = 1")
    expect(MOCK_STDOUT.join(" ")).toEqual "ruby output Typ eens x = 1."

  it "only outputs ruby output after the lesson is done", ->
    rubyHandler.Eval("x = 1")
    rubyHandler.Eval("x = 1")
    MOCK_STDOUT = []
    rubyHandler.Eval("x = 1")
    rubyHandler.Eval("hallo")
    expect(MOCK_STDOUT.join(" ")).toEqual "ruby output ruby output"