PROGRAM Decryption(INPUT, OUTPUT);
CONST
  Len = 20;
  ValidSymbol = [' ' .. 'Z'];
TYPE
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  LengthString: 1..Len;
  CipherFile: TEXT;
 
PROCEDURE Initialize(VAR Code: Chiper; VAR F: TEXT);
VAR
  Key, Value, Space: CHAR;
BEGIN
  RESET(F);
  WHILE NOT EOF(F)
  DO
    BEGIN
      IF NOT EOLN(F)
      THEN
        BEGIN
          READ(F, Key);
          IF NOT EOLN(F) AND (Key IN ValidSymbol)
          THEN
            BEGIN
              READ(F, Space);
              IF NOT EOLN(F)
              THEN
                BEGIN
                  READ(F, Value);
                  IF (Value IN ValidSymbol)
                  THEN
                    Code[Value] := Key
                END
              ELSE
                Code[Key] := Key
            END
          ELSE
            Code[Key] := Key
        END;
      READLN(F);
    END
END;

PROCEDURE Decode(VAR S: Str; LengthString: INTEGER);
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
  ASSIGN(CipherFile, 'cipher.txt');
  Initialize(Code, CipherFile);
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
      Decode(Msg, LengthString)
    END
END.

