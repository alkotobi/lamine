unit uorders;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, udtm_main, SysUtils, DB, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, ActnList, Buttons, DBGrids, DBCtrls, StdCtrls, DBDateTimePicker,
  uorders_edit, DateUtils,uorder_det_edit,ucars;

type

  { Tfrm_orders }

  Tfrm_orders = class(TForm)
    act_new_car: TAction;
    act_change_car: TAction;
    act_edit_order: TAction;
    act_orders: TActionList;
    act_new_order: TAction;
    btn_client1: TBitBtn;
    btn_client2: TBitBtn;
    btn_edit_order: TBitBtn;
    btn_edit_order1: TBitBtn;
    btn_new_order: TBitBtn;
    btn_new_order1: TBitBtn;
    DBGrid2: TDBGrid;
    dts_car_models: TDataSource;
    dts_orders_det: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    dts_ordders: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    procedure act_change_carExecute(Sender: TObject);
    procedure act_clientsExecute(Sender: TObject);
    procedure act_edit_orderExecute(Sender: TObject);
    procedure act_new_carExecute(Sender: TObject);
    procedure act_new_orderExecute(Sender: TObject);
    procedure act_ordersUpdate(AAction: TBasicAction; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frm_orders: Tfrm_orders;

implementation

{$R *.lfm}

{ Tfrm_orders }
 uses udtm;
procedure Tfrm_orders.FormCreate(Sender: TObject);
begin
  with dtm do
  begin
    qry_clients.Open;
    qry_order.Open;
    qry_order_details.Open;
    qry_brands.open;
    qry_car_names.Open;
    qry_car_models.Open;
    qry_cities.Open;
    qry_colors.Open;
    qry_car_info.Open;
  end;
end;

procedure Tfrm_orders.act_edit_orderExecute(Sender: TObject);
begin
    if not Assigned(frm_edit_orders) then
  begin
    Application.CreateForm(Tfrm_edit_orders, frm_edit_orders);
  end;
  dtm.qry_order.edit;
  frm_edit_orders.ShowModal;
end;

procedure Tfrm_orders.act_new_carExecute(Sender: TObject);
begin
      if not Assigned(frm_order_detail_edit) then
  begin
    Application.CreateForm(Tfrm_order_detail_edit, frm_order_detail_edit);
  end;
    dtm.qry_order_details.Append;
    dtm.qry_order_details.FieldByName('date_ordered').AsDateTime:=date;
    frm_order_detail_edit.ShowModal;
end;

procedure Tfrm_orders.act_change_carExecute(Sender: TObject);
begin
    if not Assigned(frm_order_detail_edit) then
  begin
    Application.CreateForm(Tfrm_order_detail_edit, frm_order_detail_edit);
  end;
    dtm.qry_order_details.edit;
    frm_order_detail_edit.ShowModal;
end;

procedure Tfrm_orders.act_clientsExecute(Sender: TObject);
begin
      if not Assigned(frm_cars) then
  begin
    Application.CreateForm(Tfrm_cars, frm_cars);
  end;
      frm_cars.showModal;
end;

procedure Tfrm_orders.act_new_orderExecute(Sender: TObject);
begin
  if not Assigned(frm_edit_orders) then
  begin
    Application.CreateForm(Tfrm_edit_orders, frm_edit_orders);
  end;
  dtm.qry_order.Append;
  dtm.qry_order.FieldByName('date').AsDateTime:=date();
  frm_edit_orders.ShowModal;

end;

procedure Tfrm_orders.act_ordersUpdate(AAction: TBasicAction;
  var Handled: Boolean);
begin
  act_new_order.Enabled:=dtm_login.qry_permissionscan_order_new.AsBoolean;
  act_edit_order.Enabled:=dtm_login.qry_permissionscan_order_edit.AsBoolean;
  act_new_car.Enabled:=dtm_login.qry_permissionscan_order_det_new.AsBoolean;
  act_change_car.Enabled:=dtm_login.qry_permissionscan_order_det_edit.AsBoolean;
end;

procedure Tfrm_orders.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if (dtm.qry_order.State in dsEditModes) or
  (dtm.qry_order_details.State in dsEditModes) then
  begin
    showMessage('please save all changes before close the form');
    CloseAction:=TCloseAction.caNone;
  end;
end;

end.

