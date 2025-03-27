unit uorders;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, udtm_main, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, ActnList, Buttons, DBGrids, DBCtrls,uorders_edit,DateUtils;

type

  { Tfrm_orders }

  Tfrm_orders = class(TForm)
    ActionList1: TActionList;
    act_new_order: TAction;
    btn_client: TBitBtn;
    btn_new_order: TBitBtn;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dts_ordders: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure btn_new_orderClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frm_orders: Tfrm_orders;

implementation

{$R *.lfm}

{ Tfrm_orders }

procedure Tfrm_orders.FormCreate(Sender: TObject);
begin
  with dtm do
  begin
    qry_clients.Open;
    qry_order.Open;
  end;
end;

procedure Tfrm_orders.btn_new_orderClick(Sender: TObject);
var ref,name:string;
  id:integer;
  bk:TBookMark;
begin
  if not Assigned(frm_edit_orders) then
  begin
    Application.CreateForm(Tfrm_edit_orders, frm_edit_orders);
  end;
  bk := dtm.qry_order.GetBookmark;
  dtm.qry_order.Last;
  if dtm.qry_order.IsEmpty then id:=0
  else
  id := dtm.qry_order.FieldByName('id').AsInteger;
  dtm.qry_order.GotoBookmark(bk);
  dtm.qry_order.Append;
  dtm.qry_clients.FindKey([dtm.qry_order.FieldByName('id').AsInteger]);
  name :=dtm.qry_clients.FieldByName('name').AsString;
  ref := name[0]+name[1]+name[2];

  dtm.qry_order.FieldByName('ref').AsString:=ref+inttostr(MonthOf(date))+inttostr(dayof(date))+'/'+inttostr(id);
  frm_edit_orders.ShowModal;
end;

end.

