require 'rouge'

module Rouge
  module Lexers
    class Turtle < RegexLexer
      title 'Turtle'
      desc 'Turtle RDF syntax'
      tag 'turtle'
      aliases 'ttl'
      filenames '*.ttl'
      mimetypes 'text/turtle'

      state :root do
        rule %r/\s+/, Text::Whitespace
        rule %r/#.*$/, Comment::Single

        # Prefix declarations
        rule %r/@prefix\b/, Keyword::Declaration
        rule %r/@base\b/, Keyword::Declaration

        # PREFIX / BASE keywords (SPARQL style)
        rule %r/\b(PREFIX|BASE)\b/i, Keyword::Declaration

        # IRIs
        rule %r/<[^>]*>/, Name::Tag

        # Prefixed names
        rule %r/([a-zA-Z_][a-zA-Z0-9_-]*)?:([a-zA-Z0-9_\-\.]*)?/, Name::Constant

        # Blank nodes
        rule %r/_:[a-zA-Z0-9_-]+/, Name::Variable
        rule %r/\[\]/, Name::Variable

        # RDF type shorthand
        rule %r/\ba\b/, Keyword::Type

        # Literals
        rule %r/""".*?"""/m, Str::Double
        rule %r/'''.*?'''/m, Str::Single
        rule %r/"([^"\\]|\\.)*"/, Str::Double
        rule %r/'([^'\\]|\\.)*'/, Str::Single

        # Datatype / language tags
        rule %r/\^\^/, Punctuation
        rule %r/@[a-zA-Z]+(-[a-zA-Z0-9]+)*/, Name::Attribute

        # Numbers
        rule %r/[+-]?\d+\.\d*([eE][+-]?\d+)?/, Num::Float
        rule %r/[+-]?\d+/, Num::Integer
        rule %r/true|false/, Keyword::Constant

        # Punctuation
        rule %r/[.;,\[\](){}]/, Punctuation
      end
    end
  end
end
