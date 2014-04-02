this.lesson = new Lesson([
  new Question(
    {
      description: "Laten we bij het begin beginnen! In Ruby kun je makkelijk variabelen gebruiken om iets in op te slaan. Begin eens met je naam, bijvoorbeeld\nnaam = \"Henk\"",
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
      description: "Een stuk tekst tussen aanhalingstekens heet een String. Met 'puts' geeft Ruby output. Als je een variabele in een string wilt zetten, gebruik je een hekje, gevolgd door accolades. Bijvoorbeeld zo:\nputs \"Hallo, \#\{naam\}\"",
      answer: /^puts\s*\"[\w\s\,]+\#\{naam\}\!?\"$/,
      possible_errors: {
          quotes_vergeten: /^puts\s*\"?[\w\s\,]+\#\{naam\}\!?\"?$/,
      },
      error_messages: {
          quotes_vergeten: "Let op de aanhalingstekens.",
          default: "Dat is niet goed. Typte je puts \"Hallo, \#\{naam\}?\""
      }
  }),
  new Question(
    {
      description: "Ruby kan ook rekenen. Typ maar eens 3 + 4.",
      answer: /^-?\d+\s*\+\s*-?\d+\s*$/,
      possible_errors: {
        min: /^\d+\s*-\s*\d+\s*$/
      },
      error_messages: {
        min: "Inderdaad, Ruby kan ook getallen van elkaar aftrekken! Typ je toch even 3 + 4?",
        default: "Dat is niet goed. Tel je twee getallen op?"
      }
  }),
  new Question(
    {
      description: "Heel goed. Wat dacht je van 5 * 8?",
      answer: /^-?\d+\s*\*\s*-?\d+\s*$/,
      possible_errors: {
      },
      error_messages: {
        default: "Dat is niet goed. Gebruik je * (een sterretje)?"
      }
  }),
  new Question(
    {
      description: "* (sterretje) betekent 'keer'. Wat denk je dat 2 ** 4 doet?",
      answer: /^-?\d+\s*\*\*\s*-?\d+\s*$/,
      possible_errors: {
      },
      error_messages: {
        default: "Dat is niet goed. Gebruik je **?"
      }
  }),
  new Question(
    {
      description: "** is machtsverheffen. Nu gaan we aan Ruby vragen of een uitspraak 'waar' of 'niet waar' is. Typ eens 3 < 5 (drie is kleiner dan 5.)",
      answer: /^3\s*<\s*5\s*$/,
      possible_errors: {
      },
      error_messages: {
        default: "Dat is niet goed. Gebruik < ('kleiner dan'.)"
      }
  }),
  new Question(
    {
      description: "true! Typ nu eens 1 + 1 == 3.",
      answer: /^1\s*\+\s*1\s*==\s*3\s*$/,
      possible_errors: {
        enkele_is: /^1\s*\+\s*1\s*=\s*3\s*$/
      },
      error_messages: {
        enkele_is: 'Gebruik een dubbel is-teken! Een enkel is-teken wordt gebruikt voor het toewijzen van een variabele (bijvoorbeeld naam = "Henk"). Om te kijken of een uitspraak true of false is heb je == nodig. Ruby snapt het niet, zie je? Typ 1 + 1 == 3.'
        default: "Dat is niet goed. Typ je 1 + 1 == 3?"
      }
  }),
  new Question(
    {
      description: "1 + 1 is natuurlijk geen 3, dus Ruby geeft false. Typ nu eens 5 != 10 (vijf is niet gelijk aan tien.)",
      answer: /^-?\d+\s*!=\s*-?\d+\s*$/,
      possible_errors: {
        
      },
      error_messages: {
        default: "Dat is niet goed. Gebruik je != (is niet gelijk aan?)"
      }
  }),
  new Question(
    {
      description: "Goed gedaan! Nu gaan we logica toevoegen. Een if-statement gebruik je om iets alleen te laten uitvoeren als aan een voorwaarde wordt voldaan.\nTyp eens:\nif naam == \"je naam\"\n   puts \"Hallo, \#\{naam\}!\"\nend",
      answer: /if\s*naam\s*==\s*\"[\w\s]*\"\s*\n\s*puts\s*\"[\w\s\!\,]+\#\{naam\}\!?"\s*\n\s*end/,
      possible_errors: {
          quotes_vergeten: /if\s*naam\s*==\s*\"?[\w\s]*\"?\s*\n\s*puts\s*\"?[\w\s\!\,]+\#\{naam\}\!?"?\s*\n\s*end/,
          enkele_is: /if\s*naam\s*=\s*\"[\w\s]*\"\s*\n\s*puts\s*\"[\w\s\!\,]+\#\{naam\}\!?"\s*\n\s*end/
      },
      error_messages: {
          quotes_vergeten: "Let op de aanhalingstekens.",
          enkele_is: "Gebruik in een if-statement altijd een dubbel =-teken. Bij toewijzen van variabelen gebruik je een enkel =-teken."
          default: "Dat is niet goed. Typte je\nif naam == \"je naam\"\n   puts \"Hallo, \#\{naam\}!\"\nend"
      }
  }),
  new Question(
    {
      description: "Oke! Bij een if kun je ook een else zetten. Dit gebruik je als je nog een andere mogelijk verwacht. Let op dat je alsnog een end krijgt aan het einde.\nTyp eens:\nif 9 \> 10\n   puts \"Dit is bijzonder!\"\nelse\n   puts \"Gelukkig, het klopt!\"\nend",
      answer: /^if\s*9\s*>\s*10\s*\n\s*puts\s*\"[\w\s\,\!]+\"\s*\n\s*else\s*\n\s*puts\s*\"[\w\s\,\!]+\"\s*\n\s*end\s*$/,
      possible_errors: {
          quotes_vergeten: /^if\s*9\s*>\s*10\s*\n\s*puts\s*\"?[\w\s\,\!]+\"?\s*\n\s*else\s*\n\s*puts\s*\"?[\w\s\,\!]+\"?\s*\n\s*end\s*$/,
          end_vergeten: /^if\s*9\s*>\s*10\s*\n\s*puts\s*\"[\w\s\,\!]+\"\s*\n\s*else\s*\n\s*puts\s*\"[\w\s\,\!]+\"\s*\n\s*$/
      },
      error_messages: {
          quotes_vergeten: "Let op de aanhalingstekens.",
          end_vergeten: "Let op dat je ook bij else afsluit met end!",
          default: "Dat is niet goed. Typte je\nif 9 \> 10\n   puts \"Dit is bijzonder!\"\nelse\n   puts \"Gelukkig, het klopt!\"\nend"
      }
  })
])