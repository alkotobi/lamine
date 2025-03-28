unit uorders_edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, EditBtn, StdCtrls,
  DBCtrls, Buttons, ExtCtrls,DateUtils, DBDateTimePicker, udtm_main;

type

  { Tfrm_edit_orders }

  Tfrm_edit_orders = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBDateTimePicker1: TDBDateTimePicker;
    DBEdit1: TDBEdit;
    dbedt_ref: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    dts_broker: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tfrm_edit_orders.BitBtn1Click(Sender: TObject);
begin
  dtm.qry_order.Cancel;
  close;
end;

procedure Tfrm_edit_orders.BitBtn2Click(Sender: TObject);
begin
  try
    dtm.qry_order.Post;

  except
    on e:Exception do
    begin
      ShowMessage(e.Message);
      exit;
    end;
  end;
  close;
end;

procedure Tfrm_edit_orders.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dtm.qry_order.Cancel;
end;

end.

