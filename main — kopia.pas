program Calculator;

{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}

uses
  SysUtils;

// Function to underline digits that are not 0 or 1
function UnderlineExceptions(numberStr: string): string;
var
  digit: Char;
begin
  Result := '';
  for digit in numberStr do
  begin
    if not (digit in ['0', '1']) then
    begin
      Result := 'Error: Unexpected digit ''' + digit + ''' found.';
      Exit;
    end
    else
      Result := Result + #27'[4m' + digit + #27'[0m'; // Using ANSI escape codes for underlining
  end;
end;

// Function to convert decimal to binary
function DecToBin(userInput: string): string;
var
  number: Int64;
begin
  try
    number := StrToInt64(userInput);
    Result := IntToBin(number);
  except
    Result := 'Error: Input is not a valid number.';
  end;
end;

// Function to convert binary to decimal
function BinToDec(userInput: string): string;
var
  number: Int64;
begin
  try
    number := BinStrToInt(userInput);
    Result := IntToStr(number);
  except
    Result := 'Error: Input is not a valid binary number.';
  end;
end;

var
  userInput: string;
  operatorInput: Char;
  num1, num2: Int64;
begin
  // Displaying the title
  WriteLn('=================================');
  WriteLn('       CALCULATOR');
  WriteLn('=================================');

  // Main loop
  while True do
  begin
    // Displaying the menu
    WriteLn('[1] Decimal to Binary');
    WriteLn('[2] Binary to Decimal');
    Write('>> ');
    ReadLn(userInput);

    // Performing the selected operation
    case userInput of
      '1':
      begin
        Write('Enter a decimal number: ');
        ReadLn(userInput);
        WriteLn('Binary representation: ', DecToBin(userInput));
      end;
      '2':
      begin
        Write('Enter a binary number: ');
        ReadLn(userInput);
        WriteLn(UnderlineExceptions(userInput));
        WriteLn('Decimal representation: ', BinToDec(userInput));
      end;
    else
      WriteLn('Invalid Input');
    end;
  end;
end.
