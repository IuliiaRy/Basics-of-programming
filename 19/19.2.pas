PROGRAM SortDate(INPUT, OUTPUT);
USES
  DateWork;
VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT; 
BEGIN
  ASSIGN(DateFile, 'DF.TXT');
  ASSIGN(TFile, 'TF.TXT');
  ASSIGN(FInput, 'FI.TXT');
  REWRITE(DateFile);
  RESET(FInput);
  ReadDate(FInput, VarDate);
  READLN(FInput);
  WRITE(DateFile, VarDate);
  RESET(DateFile);
  WHILE NOT EOF(FInput)
  DO
    BEGIN
      RESET(DateFile);
      ReadDate(FInput, D);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN                
          REWRITE(TFile);
          Copying := TRUE;
          WHILE NOT EOF(DateFile) AND Copying
          DO
            BEGIN
              READ(DateFile, VarDate);
              IF Less(VarDate, D)
              THEN
                WRITE(TFile, VarDate)
              ELSE
                Copying := FALSE
            END
        END;
      WRITE(TFile, D);
      IF NOT Copying
      THEN
        WRITE(TFile, VarDate);
      WHILE NOT EOF(DateFile)
      DO
        BEGIN
          READ(DateFile, VarDate);
          WRITE(TFile, VarDate)
        END;
      REWRITE(DateFile);
      RESET(TFile);
      WHILE NOT EOF(TFile)
      DO
        BEGIN
          READ(TFiLe, VarDate);
          WRITE(DateFile, VarDate)
        END
    END;
  RESET(DateFile);
  CopyOut(DateFile)
END.
