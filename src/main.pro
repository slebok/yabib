% Imports
:- ensure_loaded('../../../bitbucket/rlaemmel/slebook/src/Prolog/packages/prelude.pro').
:- ensure_loaded('../../../bitbucket/rlaemmel/slebook/src/Prolog/packages/dict.pro').

% Package contributions
:- ['generate-tex.pro'].

% Test target

:- runTests((

   test(
     genTeX
   )

)).
