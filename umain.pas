unit umain;

{$mode objfpc}{$H+}

interface

uses
  upermissions, utransactions,ucars, uusers, uchange_pass, udtm, Classes, SysUtils,
  DB, Forms, Controls, Graphics, Dialogs, ActnList, Menus, ExtCtrls, StdCtrls,
  DBCtrls;

type

  { Tfrm_main }

  Tfrm_main = class(TForm)
    act_cars: TAction;
    act_transactions: TAction;
    act_users: TAction;
    act_change_pass: TAction;
    act_groups: TAction;
    act: TActionList;
    Button1: TButton;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Panel1: TPanel;
    procedure actUpdate(AAction: TBasicAction; var Handled: Boolean);
    procedure act_carsExecute(Sender: TObject);
    procedure act_change_passExecute(Sender: TObject);
    procedure act_groupsExecute(Sender: TObject);
    procedure act_transactionsExecute(Sender: TObject);
    procedure act_usersExecute(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
  private

  public

  end;

var
  frm_main: Tfrm_main;

implementation

{$R *.lfm}

{ Tfrm_main }
       uses udtm_main;
procedure Tfrm_main.act_groupsExecute(Sender: TObject);
begin
  frm_groups.show;
end;

procedure Tfrm_main.act_transactionsExecute(Sender: TObject);
begin
     if not Assigned(frm_transactions) then
   begin
       Application.CreateForm(Tfrm_transactions, frm_transactions);
   en
    frm_transactions.Show;
end;

procedure Tfrm_main.act_usersExecute(Sender: TObject);
begin
   if not Assigned(frm_users) then
   begin
       Application.CreateForm(Tfrm_users, frm_users);
   end;
   frm_users.Show;
end;

procedure Tfrm_main.MenuItem3Click(Sender: TObject);
begin

end;

procedure Tfrm_main.actUpdate(AAction: TBasicAction; var Handled: Boolean);
begin
  act_groups.Enabled:=dtm_login.qry_permissions.FieldByName(can_change_groups).AsBoolean;
  act_users.Enabled:=dtm_login.qry_permissions.FieldByName(can_change_users).AsBoolean;
end;

procedure Tfrm_main.act_carsExecute(Sender: TObject);
begin
   if not Assigned(frm_cars) then
   begin
       Application.CreateForm(Tfrm_cars, frm_cars);
   end;
   frm_cars.Show;
end;

procedure Tfrm_main.act_change_passExecute(Sender: TObject);
begin
  frm_change_pass.ShowModal;
end;

end.

