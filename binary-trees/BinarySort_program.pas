Program BinarySort;
{based on "Trees" pp 492..497, "PASCAL PROGRAMMING, A Spiral Approach"

USES CRT;
CONST MaxNodes = 1000;  {for demo purposes}
TYPE
bPtr = ^node;
node = Record
         num:Integer;
         left, right:bPtr;
       End;
VAR
   ct, n:Integer;
   IntTree:bPtr;
Procedure InsertNum(VAR tree:bPtr; j:Integer);
VAR newitem:bPtr;
Begin
     If tree = NIL then
     Begin
          NEW(newitem);
          newitem^.num := j;
          newitem^.left := NIL;
          newitem^.right := NIL;
          tree := newitem;
     End
     Else
     Begin
          If j < tree^.num then InsertNum(tree^.left, j)
          Else InsertNum(tree^.right, j);
     End;
End;
Procedure PrintTree(tree:bPtr);
Begin
     If tree <> NIL then
     Begin
          Inc(ct);
          If ct mod 448 = 0 then
          Begin
               writeln; writeln('Press <Enter>':30);
               readln;
          End;
          PrintTree(tree^.left);
          Write(tree^.num:4);
          printtree(tree^.right);
     End;
End;
Begin
     ClrScr;
     Randomize;
     IntTree := NIL;
     For ct := 1 to MaxNodes Do
     Begin
          n := Random(1000);
          InsertNum(IntTree, n);
     End;
     ct := 1;
     PrintTree(IntTree);
     Writeln;
readln;
End.
