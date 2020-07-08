PROGRAM XPrint(INPUT, OUTPUT);
CONST
  Letter = 'X';
  SetBegin = 1;
  SetEnd = 25;
TYPE
  SymbolPlace = SET OF SetBegin .. SetEnd;
VAR
  Ch: CHAR;

PROCEDURE GetMatrixOfSymbol(VAR Ch: CHAR; VAR M: SymbolPlace; VAR NotSymbol: BOOLEAN);
BEGIN
  CASE Ch OF 
    '0': M := [1, 2, 3, 4, 5, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24, 25];
    '1': M := [4, 5, 8, 10, 15, 20, 25];
    '2': M := [1, 2, 3, 4, 5, 10, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25];
    '3': M := [1, 2, 3, 4, 5, 10, 13, 14, 15, 20, 21, 22, 23, 24, 25];
    '4': M := [1, 5, 6, 10, 11, 12, 13, 14, 15, 20, 25];
    '5': M := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 20, 21, 22, 23, 24, 25];
    '6': M := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 20, 21, 22, 23, 24, 25];    
    '7': M := [1, 2, 3, 4, 5, 9, 10, 13, 18, 23];
    '8': M := [1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 22, 23, 24, 25];  
    '9': M := [1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15, 20, 21, 22, 23, 24, 25];
  ELSE
    NotSymbol := TRUE
  END
END;

PROCEDURE PrintSymbol(VAR Ch: CHAR; VAR F: TEXT);
VAR 
  MatrixOfSymbol: SymbolPlace;
  NotSymbol: BOOLEAN;
  CurrentPlace: INTEGER;
BEGIN
  NotSymbol := FALSE;
  GetMatrixOfSymbol(Ch, MatrixOfSymbol, NotSymbol);
  IF (NotSymbol = FALSE)
  THEN
    BEGIN
      FOR CurrentPlace := SetBegin TO SetEnd
      DO
        BEGIN
          IF (CurrentPlace IN MatrixOfSymbol)
          THEN
            WRITE(F, Letter)
          ELSE
            WRITE(F, ' ');
          IF (CurrentPlace MOD 5 = 0)
          THEN
            WRITELN(F)
        END
    END
  ELSE
    WRITELN(F, 'Ваш символ некорректный')
END;

BEGIN
  WHILE NOT EOLN
  DO
    BEGIN
      WRITELN;
      READ(INPUT, Ch);   
      PrintSymbol(Ch, OUTPUT)
    END
END.
