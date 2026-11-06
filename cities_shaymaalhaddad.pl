% cities.pl - Lab 10, Task 1: finding paths between cities
% Run with:  ?- travel('Dammam', 'Madinah', P).   (press ; for more paths)

% ---------- FACTS: the directed edges of the graph ----------
% (two-way roads are written as two edges, one in each direction)
edge('Makkah',  'Madinah').
edge('Makkah',  'Riyadh').
edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').
edge('Taif',    'Tabuk').
edge('Taif',    'Dammam').
edge('Tabuk',   'Taif').
edge('Riyadh',  'Dammam').
edge('Dammam',  'Riyadh').
edge('Dammam',  'Qatif').
edge('Qatif',   'Dammam').
edge('Qatif',   'Madinah').

% ---------- RULES ----------

% travel(Start, Finish, Path)
travel(From, To, Path) :-
    path(From, To, [From], P),
    reverse(P, Path).

% path(Current, Finish, Visited, Path)
% Base case: we reached the destination
path(X, X, P, P).

% Recursive case: take an edge to a city we have not visited yet
path(X, To, Visited, Path) :-
    edge(X, Z),
    \+ member(Z, Visited),
    path(Z, To, [Z|Visited], Path).
