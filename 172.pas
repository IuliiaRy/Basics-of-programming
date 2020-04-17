PROGRAM EchoReadNumber(INPUT, OUTPUT);
VAR
  Number: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch); 
      IF (Ch = '0') THEN D := 0 ELSE
      IF (Ch = '1') THEN D := 1 ELSE
      IF (Ch = '2') THEN D := 2 ELSE
      IF (Ch = '3') THEN D := 3 ELSE
      IF (Ch = '4') THEN D := 4 ELSE
      IF (Ch = '5') THEN D := 5 ELSE
      IF (Ch = '6') THEN D := 6 ELSE
      IF (Ch = '7') THEN D := 7 ELSE
      IF (Ch = '8') THEN D := 8 ELSE
      IF (Ch = '9') THEN D := 9 ELSE
      D := -1
    END
  ELSE
    D := -1
END;
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR
  Digit: INTEGER;
BEGIN
  N := 0;
  ReadDigit(F, Digit);
  WHILE Digit <> -1
  DO
    BEGIN
      IF (N > ((MAXINT - Digit) DIV 10))
      THEN
        BEGIN
          Digit := -1;
          N := -1
        END
      ELSE
        BEGIN
          N := N * 10 + Digit;
          ReadDigit(F, Digit)
        END
    END
END;
BEGIN
  ReadNumber(INPUT, Number);
  IF Number <> -1
  THEN
    WRITELN('Ваше число: ', Number)
  ELSE
    WRITELN('Переполнение MAXINT')
END.
