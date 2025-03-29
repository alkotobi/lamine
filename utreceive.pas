unit utreceive;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, DateUtils, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
  StdCtrls, MaskEdit, DBCtrls;

type

  { Tfrm_receive }

  Tfrm_receive = class(TForm)
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
  frm_receive: Tfrm_receive;

implementation

{$R *.lfm}

{ Tfrm_receive }
    uses udtm_main,udtm;
procedure Tfrm_receive.Button2Click(Sender: TObject);
begin
  dtm.qry_transactions.cancel;
  close;
end;

procedure Tfrm_receive.Button1Click(Sender: TObject);
begin
  with dtm do
begin
  if qry_transactionsid_user_send.AsInteger = 0 then
    begin
         ShowMessage('can not rreceive  before transfer');
         exit;
    end;
  if qry_transactionsamount_received.AsCurrency =0 then
    begin
       ShowMessage('received amount can not be zero');
       exit;
    end;
   if qry_transactionsamount_received.AsCurrency >
   (qry_transactionsamount.AsCurrency/qry_transactionsrate.AsCurrency) then
     begin
        ShowMessage('received amount can npt be more then transfered');
       exit;
     end;
    if(qry_transactions.IsEmpty) then
  begin
       ShowMessage('can not do this operation on empty table');
       exit;
  end;
  qry_transactions.FieldByName(id_user_receive).AsInteger:=
  dtm_login.qry_users.FieldByName('id').AsInteger;
  qry_transactions.FieldByName(date_receive).AsDateTime:=
  LocalTimeToUniversal(date);
  qry_transactions.Post;
  close;
end;

end;

end.

