genTeX :-
  readTermFile('bib.term', Data),
  open('bib.tex', write, Out),
  map(genTeX(Out), Data).

genTeX(
    Out,
    Dict
  ) :-
        lookup(key, Dict, Key),
        format('Processing ~w.~n', [Key]),
        format(Out, '\\papersection{~w}~n', [Key]),
        format(Out, '\\begin{description}~n', []),
        texItem(Out, 'Citation'), 
        format(Out, '\\cite{~w}~n', [Key]),
        lookup(title, Dict, Title),
        texItem(Out, 'Title'), 
        format(Out, '~w~n', [Title]),
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
