PROGRAM XPrint(INPUT, OUTPUT);
CONST
  Letter = 'a';
  SetBegin = 1;
  SetEnd = 25;
TYPE
  SymPlace = SET OF SetBegin .. SetEnd;
VAR
  Ch: CHAR;
PROCEDURE DefiningOfSet(VAR Ch: CHAR; VAR M: SymPlace; VAR NotSym: BOOLEAN);
{Определяет множество для символа}
BEGIN{DefiningOfSet}
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
    NotSym := TRUE 
  END;
END;{DefiningOfSet}
PROCEDURE GraphicPrinting(VAR Ch: CHAR; VAR F: TEXT);
{Преобразует строку цифр из файла в графический вид}
VAR 
  NumPlace: SymPlace;
  NotSym: BOOLEAN;
  i: INTEGER;
BEGIN{GraphicPrinting}
  NotSym := FALSE;
  DefiningOfSet(Ch, NumPlace, NotSym);
  IF (NotSym = FALSE)
  THEN
    BEGIN
      FOR i := SetBegin TO SetEnd
      DO
        BEGIN
          IF( i IN NumPlace)
          THEN
            WRITE(Letter)
          ELSE
            WRITE(' ');
          IF (i MOD 5 = 0)
          THEN
            WRITELN
        END
    END
    ELSE
      WRITELN('Ваш символ некорректный');
END;{GraphicPrinting}
BEGIN{XPrint}
  WHILE NOT EOLN
  DO
    BEGIN
      WRITELN;
      READ(INPUT, Ch);   
      GraphicPrinting(Ch, OUTPUT)
    END
END.{XPrint}
