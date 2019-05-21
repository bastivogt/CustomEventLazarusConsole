program counter;

uses sebastian.vogt;

type
  TEventObject = class
    public
      procedure counterStart(Sender: TObject);
      procedure counterChange(Sender: TObject);
      procedure counterFinish(Sender: TObject);
  end;

procedure TEventObject.counterStart(Sender: TObject);
begin
  WriteLn('onCounterStart ', TCounter(Sender).Count);
end;

procedure TEventObject.counterChange(Sender: TObject);
var me: TCounter;
begin
  me := TCounter(Sender);
  WriteLn('onCounterChange ', me.Count);
end;

procedure TEventObject.counterFinish(Sender: TObject);
var me: TCounter;
begin
  me := Sender as TCounter;
  WriteLn('onCounterFinish ', me.Count);
end;



var
  c: TCounter;
  eo: TEventObject;

begin

  //eo := TEventObject.Create;


  c := TCounter.create;
  c.onCounterStart := eo.counterStart;
  c.onCounterChange := eo.counterChange;
  c.onCounterFinish := eo.counterFinish;


  c.onCounterStart := nil;
  c.run;

  WriteLn('Press any key to quit ...');
  ReadLn;
end.

