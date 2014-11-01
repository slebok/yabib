% Reuse prelude of SLEPRO project
:- ['../../slepro/prelude/higher-order.pro'].
:- ['../../slepro/prelude/io.pro'].
:- ['../../slepro/prelude/test.pro'].
:- ['../../slepro/languages/dict/crud.pro'].
:- ['../../slepro/languages/dict/conversion.pro'].

% Actual generator code
:- ['generate-tex.pro'].

% Initialize housekeeping for testing
:- initTesting.

% Run TeX generator
:- genTeX.

% Done
:- halt.
