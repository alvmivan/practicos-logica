insertSorted(Elem,[],[Elem]).
insertSorted(Elem,[X|Rest],[Elem,X|Rest]):-
    X> Elem.
insertSorted(Elem,[X|Rest],[X|SubList]):-
    not(X >Elem),
    insertSorted(Elem,Rest,SubList).


sortList([],[]).
sortList([X|Rest], ListOut):-
    sortList(Rest,RestSort),
    insertSorted(X,RestSort,ListOut).


crearArbolVacio(n).

% (hijo izquierdo , elemento, hijo derecho)
%insertar(E,A,NA).
insertar(E,n,[n,E,n]).

insertar(E,[NodoDerecho,ElementoActual,NodoIzquierdo], [NodoDerecho, ElementoActual,NuevoNodoIzquierdo]):-
    E > ElementoActual,
    insertar(E, NodoIzquierdo, NuevoNodoIzquierdo).

insertar(E,[NodoDerecho,ElementoActual,NodoIzquierdo], [NuevoNodoDerecho, ElementoActual,NodoIzquierdo]):-
    not(E > ElementoActual),
    insertar(E, NodoDerecho, NuevoNodoDerecho).



borrarSubArbol([n,_,n], n).
borrarSubArbol([n,_,SubArbol], SubArbol):-
    not(SubArbol == n).
borrarSubArbol([SubArbol,_,n], SubArbol):-
    not(SubArbol == n).


encontrarSubArbol(Elemento,[NI,Elemento,ND],[NI,Elemento,ND]).

encontrarSubArbol(Elemento,[ND,El,NI],Nodo):-
    Elemento > El,
    encontrarSubArbol(Elemento,NI,Nodo).
    

encontrarSubArbol(Elemento,[ND,El,NI],Nodo):-
    not(Elemento > El),
    encontrarSubArbol(Elemento,ND,Nodo).


%reemplazar(Elemento,[NI,Elemento,ND],NuevoNodo,NuevoSubArbol).
reemplazar(Elemento,[_NI,Elemento,_ND],NuevoNodo, NuevoNodo).

reemplazar(Elemento,[ND,El,NI],NuevoNodo,[ND,El,NuevoSubArbol]):-
    Elemento > El,
    reemplazar(Elemento,NI,NuevoNodo,NuevoSubArbol).
    

reemplazar(Elemento,[ND,El,NI],NuevoNodo,[NuevoSubArbol,El,NI]):-
    not(Elemento > El),
    reemplazar(Elemento,ND,NuevoNodo,NuevoSubArbol).

    
eliminar(Elemento,Arbol,NuevoArbol):-
    encontrarSubArbol(Elemento,Arbol,SubArbol),
    borrarSubArbol(SubArbol,NuevoNodo),
    reemplazar(Elemento,Arbol,NuevoNodo,NuevoArbol).

max(A,B,Max):- sortList([A,B],[_,Max]).
min(A,B,Min):- sortList([A,B],[Min,_]).

altura(n,0).
altura([ND,_,NI],AMU):-
    altura(ND,AlturaD),
    altura(NI,AlturaI),
    max(AlturaD,AlturaI,Altura),
    AMU is Altura+1.


maxDepth(N,D):-altura(N,D).

minDepth(n,0).
minDepth([ND,_,NI],AMU):-
    altura(ND,AlturaD),
    altura(NI,AlturaI),
    min(AlturaD,AlturaI,Altura),
    AMU is Altura+1.

balanceado(n).
balanceado(Nodo):-
    minDepth(Nodo,MDI),
    maxDepth(Nodo,MDI).
    
    
    









    
    
    
    
    
    
    
    
    


   
    