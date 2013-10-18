genTeX :-
  readTermFile('bib.term', Data),
  open('bib.tex', write, Out),
  map(genTeX(Out), Data).

genTeX(
    Out,
    Dict
  ) :-
        lookup(key, Dict, Key),
        format(Out, '\\mainsection{~w}~n', [Key]),
        format(Out, '\\begin{description}~n', []),
        lookup(class, Dict, Class),
        texItem(Out, 'Class'), 
        format(Out, '~w~n', [Class]),
        lookup(title, Dict, Title),
        texItem(Out, 'Title'), 
        format(Out, '~w~n', [Title]),
        lookup(authors, Dict, Authors),
        texItem(Out, 'Author(s)'), 
        writeCommaSepList(Out, Authors),
        lookup(year, Dict, Year),
        texItem(Out, 'Year published'),
        format(Out, '~w~n', [Year]),
        lookup(url, Dict, URL),
        texItem(Out, 'Online URL'),
        format(Out, '{\\footnotesize\\url{~w}}~n', [URL]),
        ( lookup(note, Dict, [Note]) ->
              texItem(Out, 'Note'),
              write(Out, Note),
              nl(Out)
            ; true ),
        lookup(required, Dict, Required),
        texItem(Out, 'Required concepts'),
        writeCommaSepList(Out, Required),
        lookup(provided, Dict, Provided),
        texItem(Out, 'Provided concepts'),
        writeCommaSepList(Out, Provided),
        lookup(annote, Dict, Annote),
        texItem(Out, 'Annotation'),
        write(Out, Annote),
        nl(Out),
        format(Out, '\\end{description}~n~n', []),
        format(Out, '\\illusection{~w}{%~n', [Key]),
        lookup(figure, Dict, Figure),
        format(Out, '~w}~n', [Figure]).

texItem(Out, K) :-
  format(Out, '\\item[~w]\\mbox{}\\\\~n', [K]).

writeCommaSepList(_, []).
writeCommaSepList(Out, [H|T]) :-
  write(Out, H),
  writeCommaSepRestList(Out, T).
writeCommaSepRestList(_, []).
writeCommaSepRestList(Out, [H|T]) :-
  write(Out, ', '),
  write(Out, H),
  writeCommaSepRestList(Out, T).
