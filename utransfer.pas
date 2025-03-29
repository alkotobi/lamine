unit utransfer;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, DateUtils, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
  StdCtrls, LCLType, MaskEdit, DBCtrls;

type

  { Tfrm_transfer }

  Tfrm_transfer = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    dts_transactions: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  frm_transfer: Tfrm_transfer;

implementation

{$R *.lfm}

{ Tfrm_transfer }
    uses udtm_main,udtm;
procedure Tfrm_transfer.Button2Click(Sender: TObject);
begin
  dtm.qry_transactions.Cancel;
  close;
end;

procedure Tfrm_transfer.Button1Click(Sender: TObject);
begin
  with dtm do
begin
    if(dtm.qry_transactionsrate.AsCurrency = 0) then
  begin
       ShowMessage('please specify  the rate');
       exit;
  end;
  if(qry_transactions.IsEmpty) then
  begin
       ShowMessage('can not do this operation on empty table');
       exit;
  end;
  qry_transactions.FieldByName(id_user_send).AsInteger:=
  dtm_login.qry_users.FieldByName('id').AsInteger;
  qry_transactions.FieldByName(date_send).AsDateTime:=
  LocalTimeToUniversal(date);
  qry_transactions.Post;
  close;
end;

end;

end.

