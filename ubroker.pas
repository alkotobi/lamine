unit ubroker;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, DBCtrls;

type

  { Tfrm_broker }

  Tfrm_broker = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dts_broker: TDataSource;
  private

  public

  end;

var
  frm_broker: Tfrm_broker;

implementation

{$R *.lfm}

end.

