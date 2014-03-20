this.lesson = new Lesson([
  new Question(
    {
      description: "Laten we bij het begin beginnen! In Ruby kun je makkelijk variabelen gebruiken om iets in op te slaan. Begin eens met x = 1",
      answer: /x\s*=\s*1/,
      possible_errors: {
          wrong_value: /x\s*=\s*\d/
          dubbele_is: /x\s*==\s*\d/
      },
      error_messages: {
          wrong_value: "Je hebt de verkeerde waarde toegewezen.",
          dubbele_is: "Gebruik bij het toewijzen van variabelen een enkel =-teken."
          default: "Dat is niet goed. Typte je x = 1?"
      }
  }),
  new Question(
    {
      description: "Oké, dat viel mee. Een andere soort variabele is een 'string'. Gebruik hiervoor aanhalingstekens. Typ eens naam = \"jouw naam\"",
      answer: /naam\s*=\s*\"[\w\s]*\"/,
      possible_errors: {
          quotes_vergeten: /^naam\s*=\s*\"?[\w\s]+\"?$/,
          dubbele_is: /^naam\s*==\s*\"?[\w\s]+\"?$/

      },
      error_messages: {
          quotes_vergeten: "Let op de aanhalingstekens.",
          dubbele_is: "Gebruik een enkel =-teken bij het toewijzen van variabelen."
          default: "Dat is niet goed. Typte je naam = \"je naam\"?"
      }
  }),
  new Question(
    {
      description: "Goed gedaan! Nu gaan we logica toevoegen. Een if-statement gebruik je om iets alleen te laten uitvoeren als aan een voorwaarde wordt voldaan.\nTyp eens:\nif x == 1\n   puts \"x is 1!\"\nend",
      answer: /if\s*x\s*==\s*1\s*\n\s*puts\s*\"[\w\s\!]+\"\s*\n\s*end/,
      possible_errors: {
          quotes_vergeten: /if\s*x\s*==\s*1\s*\n\s*puts\s*\"?[\w\s\!]+\"?\s*\n\s*end/,
          enkele_is: /if\s*x\s*=\s*1\s*\n\s*puts\s*\"?[\w\s\!]+\"?\s*\n\s*end/
      },
      error_messages: {
          quotes_vergeten: "Let op de aanhalingstekens.",
          enkele_is: "Gebruik in een if-statement altijd een dubbel =-teken. Bij toewijzen van variabelen gebruik je een enkel =-teken."
          default: "Dat is niet goed. Typte je\nif x == 1\n   puts \"x is 1!\"\nend"
      }
  })
])