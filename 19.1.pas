PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 100;
TYPE 
  SetMinMax = SET OF Min .. Max;
VAR
  SetOfNumbers: SetMinMax;
PROCEDURE FinderSimpleNumbers(VAR SetOfNumb: SetMinMax);
VAR
  NextNumb, CurrentNumb: INTEGER;
BEGIN
  NextNumb := Min;
  WHILE NextNumb <> SQRT(Max)
  DO
    BEGIN
      CurrentNumb := NextNumb;
      WHILE CurrentNumb <= Max
      DO
        BEGIN
          CurrentNumb := CurrentNumb + NextNumb;
          SetOfNumb := SetOfNumb - [CurrentNumb]
        END;
      NextNumb := NextNumb + 1  
    END
END; 

PROCEDURE WriteSet(SetOfNumb: SetMinMax);
VAR
  CurrentNumb: INTEGER;
BEGIN
  CurrentNumb := Min;
  WHILE CurrentNumb <> Max
  DO
    BEGIN
      IF CurrentNumb IN SetOfNumb
      THEN
        WRITE(CurrentNumb, ' ');
      CurrentNumb := CurrentNumb + 1 
    END
END; 

BEGIN
  SetOfNumbers := [Min .. Max];
  FinderSimpleNumbers(SetOfNumbers);
  WRITE('Множество простых чисел от ', Min , ' до ', Max , ': ');
  WriteSet(SetOfNumbers);
END.

