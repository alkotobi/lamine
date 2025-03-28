unit umain;

{$mode objfpc}{$H+}

interface

uses
  upermissions,uclors,uorders,ubroker, ucountries,ucities,uclients, utransactions,ucars, uusers, uchange_pass, udtm, Classes, SysUtils,
  DB, Forms, Controls, Graphics, Dialogs, ActnList, Menus, ExtCtrls, StdCtrls,
  DBCtrls, Buttons;

type

  { Tfrm_main }

  Tfrm_main = class(TForm)
    act_colors: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cat_broker: TAction;
    act_orderes: TAction;
    act_cities: TAction;
    act_clients: TAction;
    act_countries: TAction;
    act_cars: TAction;
    act_transactions: TAction;
    act_users: TAction;
    act_change_pass: TAction;
    act_groups: TAction;
    act: TActionList;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Panel1: TPanel;
    procedure actUpdate(AAction: TBasicAction; var Handled: Boolean);
    procedure act_carsExecute(Sender: TObject);
    procedure act_change_passExecute(Sender: TObject);
    procedure act_citiesExecute(Sender: TObject);
    procedure act_clientsExecute(Sender: TObject);
    procedure act_colorsExecute(Sender: TObject);
    procedure act_countriesExecute(Sender: TObject);
    procedure act_groupsExecute(Sender: TObject);
    procedure act_orderesExecute(Sender: TObject);
    procedure act_transactionsExecute(Sender: TObject);
    procedure act_usersExecute(Sender: TObject);
    procedure cat_brokerExecute(Sender: TObject);
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

procedure Tfrm_main.act_orderesExecute(Sender: TObject);
begin
       if not Assigned(frm_orders) then
   begin
       Application.CreateForm(Tfrm_orders, frm_orders);
   end;
    frm_orders.Show;
end;

procedure Tfrm_main.act_transactionsExecute(Sender: TObject);
begin
     if not Assigned(frm_transactions) then
   begin
       Application.CreateForm(Tfrm_transactions, frm_transactions);
   end;
    frm_transactions.Show;
end;

procedure Tfrm_main.act_usersExecute(Sender: TObject);
begin
   if not Assigned(frm_users) then
   begin
       Application.CreateForm(Tfrm_users, frm_users);
   end;
   frm_users.ShowModal;
end;

procedure Tfrm_main.cat_brokerExecute(Sender: TObject);
begin
    if not Assigned(frm_broker) then
   begin
       Application.CreateForm(Tfrm_broker, frm_broker);
   end;
   frm_broker.ShowModal;
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
   frm_cars.ShowModal;
end;

procedure Tfrm_main.act_change_passExecute(Sender: TObject);
begin
  frm_change_pass.ShowModal;
end;

procedure Tfrm_main.act_citiesExecute(Sender: TObject);
begin
    if not Assigned(frm_cities) then
  begin
      Application.CreateForm(Tfrm_cities, frm_cities);
  end;
  frm_cities.ShowModal;
end;

procedure Tfrm_main.act_clientsExecute(Sender: TObject);
begin
   if not Assigned(frm_clients) then
  begin
      Application.CreateForm(Tfrm_clients, frm_clients);
  end;
  frm_clients.ShowModal;
end;

procedure Tfrm_main.act_colorsExecute(Sender: TObject);
begin
     if not Assigned(frm_colors) then
   begin
       Application.CreateForm(Tfrm_colors, frm_colors);
   end;
   frm_colors.ShowModal;
end;

procedure Tfrm_main.act_countriesExecute(Sender: TObject);
begin
    if not Assigned(frm_countries) then
   begin
       Application.CreateForm(Tfrm_countries, frm_countries);
   end;
   frm_countries.ShowModal;
end;

end.

