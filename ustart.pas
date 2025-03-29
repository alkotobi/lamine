unit ustart;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, DateUtils, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
  StdCtrls, MaskEdit, DBCtrls;

type

  { Tfrm_start }

  Tfrm_start = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    dts_clients: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edt_amountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

  public

  end;

var
  frm_start: Tfrm_start;

implementation

{$R *.lfm}

{ Tfrm_start }
    uses udtm_main,udtm;
procedure Tfrm_start.Button2Click(Sender: TObject);
begin
  dtm.qry_transactions.Cancel;
  close;
end;

procedure Tfrm_start.edt_amountKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_start.Button1Click(Sender: TObject);
begin
  with dtm do
begin
    qry_transactionsid_user_will_send.AsInteger:=
  dtm_login.qry_users.FieldByName('id').AsInteger;
    dtm.qry_transactionsdate_will_send.AsDateTime:=
  LocalTimeToUniversal(date);
  qry_transactions.Post;
  close;
end;

end;

end.

