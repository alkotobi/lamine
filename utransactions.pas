unit utransactions;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, ExtCtrls,
  DBCtrls, StdCtrls;

type

  { Tfrm_transactions }

  Tfrm_transactions = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    cmb_will_send: TComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    dts_transactions: TDataSource;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    pnl_start: TPanel;
    pnl_send: TPanel;
    pnl_receive: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure cmb_will_sendChange(Sender: TObject);
    procedure cmb_will_sendEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frm_transactions: Tfrm_transactions;

implementation

{$R *.lfm}

{ Tfrm_transactions }
 uses udtm,udtm_main,ustart,utransfer,utreceive;

procedure Tfrm_transactions.FormCreate(Sender: TObject);
begin
  with dtm do
  begin
    qry_groups.Open;
    qry_users.Open;
    qry_permissionns.Open;
    qry_transactions.open;
  end;
  pnl_receive.Visible:= dtm_login.qry_permissions.FieldByName(can_confirm_receive).AsBoolean;
  pnl_start.Visible:=dtm_login.qry_permissions.FieldByName(can_confirm_will_send).AsBoolean;
  pnl_send.Visible:=dtm_login.qry_permissions.FieldByName(can_confirm_send).AsBoolean;
end;

procedure Tfrm_transactions.Button1Click(Sender: TObject);
begin
  frm_start.ShowModal;
end;

procedure Tfrm_transactions.Button2Click(Sender: TObject);
begin
    if dtm.qry_transactions.IsEmpty then
  begin
    showMessage('no active transaction');
    exit;
  end;
  if(not dtm.qry_transactions.FieldByName(id_user_receive).IsNull) and(dtm.qry_transactions.FieldByName(id_user_receive).AsInteger <>0)then
  begin
    showMessage('already confirmed contact admin to change');
    exit;
  end;
    frm_receive.ShowModal;
end;

procedure Tfrm_transactions.Button3Click(Sender: TObject);
begin
  if dtm.qry_transactions.IsEmpty then
  begin
    showMessage('no active transaction');
    exit;
  end;
  if(not dtm.qry_transactions.FieldByName(id_user_send).IsNull) and(dtm.qry_transactions.FieldByName(id_user_send).AsInteger <>0)then
  begin
    showMessage('already confirmed contact admin to change');
    exit;
  end;
   frm_transfer.ShowModal;

end;

procedure Tfrm_transactions.cmb_will_sendChange(Sender: TObject);
begin
  if cmb_will_send.ItemIndex >=0 then
  begin
    with dtm do
    begin
     qry_users.Filter:='name="'+cmb_will_send.Text+'"';
     if qry_users.findfirst then
     begin
       qry_transactions.Filter:='id_user_will_send='+qry_usersid.AsString;
       qry_transactions.Filtered:=true;
     end;
    end;
  end
  else
  begin
    dtm.qry_transactions.Filtered:=false;
  end;
end;

procedure Tfrm_transactions.cmb_will_sendEnter(Sender: TObject);
begin
    cmb_will_send.Items.Clear;
    with dtm do
begin
  qry_users.First;
  while not qry_users.EOF do
begin
  qry_groups.Filter := 'id='+qry_usersid_group.AsString;
  if qry_groups.FindFirst then
  begin
    if(qry_permissionns.FieldByName(can_confirm_will_send).AsBoolean=true) then
    begin
      cmb_will_send.Items.Add(qry_usersname.AsString);
    end;
  end;
  qry_users.Next;
end;

end;

end;

end.

