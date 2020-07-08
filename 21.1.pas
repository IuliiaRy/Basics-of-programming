PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  LengthString: 1..Len;
 
PROCEDURE Initialize(VAR Code: Chiper);
BEGIN
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
  Code[' '] := '#';
END;

PROCEDURE Encode(VAR S: Str; LengthString: INTEGER);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN
  FOR Index := 1 TO LengthString
  DO
    IF S[Index] IN [' ' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;
 
BEGIN
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      LengthString := 1;
      WHILE NOT EOLN AND (LengthString < Len)
      DO
        BEGIN
          READ(Msg[LengthString]);
          WRITE(Msg[LengthString]);
          IF NOT EOLN
          THEN
            LengthString := LengthString + 1;
        END;
      READLN;
      WRITELN;
      Encode(Msg, LengthString)
    END
END.

