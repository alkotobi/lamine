unit uorders_edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, EditBtn, StdCtrls,
  DBCtrls, DBDateTimePicker, udtm_main;

type

  { Tfrm_edit_orders }

  Tfrm_edit_orders = class(TForm)
    dbedt_ref: TDBEdit;
    dts_clients: TDataSource;
    DBDateTimePicker1: TDBDateTimePicker;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private

  public
  id:integer;
  end;

var
  frm_edit_orders: Tfrm_edit_orders;

implementation

{$R *.lfm}

{ Tfrm_edit_orders }

procedure Tfrm_edit_orders.FormCreate(Sender: TObject);
begin
  id:=0;
end;

end.

