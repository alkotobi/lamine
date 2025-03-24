unit uchange_pass;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,udtm;

type

  { Tfrm_change_pass }

  Tfrm_change_pass = class(TForm)
    Button1: TButton;
    Button2: TButton;
    edt_old: TEdit;
    edt_new: TEdit;
    edt_confirm: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  frm_change_pass: Tfrm_change_pass;

implementation

{$R *.lfm}

{ Tfrm_change_pass }

procedure Tfrm_change_pass.Button2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_change_pass.Button1Click(Sender: TObject);
begin
   if (dtm_login.qry_users.FieldByName('password').AsString <> edt_old.Text) then
   begin
     showMessage('INCORRECT OLD PASS');
     exit;
   end;
   if(edt_new.text <> edt_confirm.text)then
   begin
      ShowMessage('PASS CONFIRM ERROR');
      exit;
   end;
   dtm_login.qry_users.edit;
   dtm_login.qry_users.FieldByName('password').AsString := edt_new.text;
   dtm_login.qry_users.post;
   ShowMessage('PASS CHANGE SUCCESSFULLY');
   close;
end;

end.

