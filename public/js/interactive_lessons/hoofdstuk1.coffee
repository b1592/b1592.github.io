this.lesson = new Lesson([
  new Question(
    {
      description: "Laten we bij het begin beginnen! In Ruby kun je makkelijk variabelen gebruiken om iets in op te slaan. Begin eens met x = 1",
      answer: /x\s*=\s*1/,
      possible_errors: {
          wrong_value: /x\s*=\s*\d/
      },
      error_messages: {
          wrong_value: "Je hebt de verkeerde waarde toegewezen.",
          default: "Dat is niet goed. Typte je x = 1?"
      }
  }),
  new Question(
    {
      description: "Oké, dat viel mee. Een andere soort variabele is een 'string'. Gebruik hiervoor aanhalingstekens. Typ eens naam = \"jouw naam\"",
      answer: /naam\s*=\s*\"[\w\s]*\"/,
      possible_errors: {
          quotes_vergeten: /naam\s*=\s*[\w\s]*|naam\s*=\s*\"[\w\s]*|naam\s*=\s*[\w\s]*\"/
      },
      error_messages: {
          quotes_vergeten: "Let op de aanhalingstekens.",
          default: "Dat is niet goed. Typte je x = 1?"
      }
  })
])