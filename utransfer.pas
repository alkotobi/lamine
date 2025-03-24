unit utransfer;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,DateUtils, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, MaskEdit;

type

  { Tfrm_transfer }

  Tfrm_transfer = class(TForm)
    Button1: TButton;
    Button2: TButton;
    edt_amount: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    mem_notes: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edt_amountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_amountKeyPress(Sender: TObject; var Key: char);
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
  close;
end;

procedure Tfrm_transfer.edt_amountKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var edit1:TEdit;
begin
    edit1:=TEDit(sender);
    if not ((Key in [Ord('0')..Ord('9'), Ord('.'), Ord('-')]) or (Ord(Key) in [8, 13])) then
    Key := 0; // Set the key to null to prevent it from being entered

  // Ensure only one decimal point is allowed
  if (Key = Ord('.')) and (Pos('.', Edit1.Text) > 0) then
    Key := 0;

  // Ensure the minus sign is only at the beginning
  if (Key = ord('-')) and (Edit1.SelStart > 0) then
    Key := 0;

end;

procedure Tfrm_transfer.edt_amountKeyPress(Sender: TObject; var Key: char);

begin

end;

procedure Tfrm_transfer.Button1Click(Sender: TObject);
begin
  with dtm do
begin
    if(edt_amount.Text ='')  or  (strtocurr(edt_amount.Text)=0) then
  begin
       ShowMessage('please specify  the rate');
       exit;
  end;
  if(qry_transactions.IsEmpty) then
  begin
       ShowMessage('can not do this operation on empty table');
       exit;
  end;
  qry_transactions.edit;
  qry_transactions.FieldByName(id_user_send).AsInteger:=
  dtm_login.qry_users.FieldByName('id').AsInteger;
  qry_transactions.FieldByName(date_send).AsDateTime:=
  LocalTimeToUniversal(date);
  qry_transactions.FieldByName('rate').AsCurrency:=StrToCurr(edt_amount.Text);
  qry_transactions.FieldByName(send_notes).AsString:=mem_notes.Text;
  qry_transactions.Post;
  close;
end;

end;

end.

