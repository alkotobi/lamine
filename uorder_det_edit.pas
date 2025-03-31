unit uorder_det_edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBCtrls, DBExtCtrls, Buttons, ActnList, udtm_main;

type

  { Tfrm_order_detail_edit }

  Tfrm_order_detail_edit = class(TForm)
    act_set_deposit: TAction;
    act_set_payed: TAction;
    act_set_loaded: TAction;
    act_set_vn: TAction;
    ActionList1: TActionList;
    btn_apply: TBitBtn;
    BitBtn10: TBitBtn;
    btn_cancel: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    ckb_loaded: TDBCheckBox;
    ckb_payed: TDBCheckBox;
    dbcmb_car: TDBLookupComboBox;
    dbcmb_car1: TDBLookupComboBox;
    dbcmb_car2: TDBLookupComboBox;
    dbcmb_client1: TDBLookupComboBox;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    dts_cities_cn: TDataSource;
    edt_deposit: TDBEdit;
    dts_cities_alg: TDataSource;
    dts_colors: TDataSource;
    edt_vin: TDBEdit;
    dts_car_info: TDataSource;
    dts_clients: TDataSource;
    dbcmb_client: TDBLookupComboBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    procedure ActionList1Update(AAction: TBasicAction; var Handled: boolean);
    procedure act_set_depositExecute(Sender: TObject);
    procedure act_set_loadedExecute(Sender: TObject);
    procedure act_set_payedExecute(Sender: TObject);
    procedure act_set_vnExecute(Sender: TObject);
    procedure btn_applyClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure protect_fields(protect: boolean);
  private

  public
    is_new_car: boolean;
  end;

var
  frm_order_detail_edit: Tfrm_order_detail_edit;

implementation

{$R *.lfm}

{ Tfrm_order_detail_edit }
uses udtm;

procedure Tfrm_order_detail_edit.btn_cancelClick(Sender: TObject);
begin
  if is_new_car then
  begin
    dtm.qry_order_details.Cancel;
    dtm.qry_order_details.Edit;
    dtm.qry_cars_stock.FieldByName('taken').AsBoolean := False;
    dtm.qry_cars_stock.FieldByName('id_order_vente').AsInteger := 0;
    dtm.qry_order_details.post;
  end
  else
    dtm.qry_order_details.Cancel;
  protect_fields(true);
  Close;
end;

procedure Tfrm_order_detail_edit.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  if dtm.qry_order_details.State in dsEditModes then
  begin
    if MessageDlg('there is unsaved data; will you cancel all?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      btn_cancel.Click;

    end
    else
      CloseAction := TCloseAction.caNone;
  end;

end;

procedure Tfrm_order_detail_edit.FormCreate(Sender: TObject);
begin
  is_new_car := False;
end;

procedure Tfrm_order_detail_edit.btn_applyClick(Sender: TObject);
begin
  dtm.qry_order_details.Post;
  protect_fields(True);
  Close;
end;

procedure Tfrm_order_detail_edit.act_set_vnExecute(Sender: TObject);
begin
  edt_vin.ReadOnly := False;
  edt_vin.SetFocus;
end;

procedure Tfrm_order_detail_edit.act_set_loadedExecute(Sender: TObject);
begin
  dtm.qry_order_detailsloaded.AsBoolean := True;
end;

procedure Tfrm_order_detail_edit.act_set_depositExecute(Sender: TObject);
begin
  edt_deposit.ReadOnly := False;
  edt_deposit.SetFocus;
end;

procedure Tfrm_order_detail_edit.ActionList1Update(AAction: TBasicAction;
  var Handled: boolean);
begin
  act_set_deposit.Enabled :=
    dtm_login.qry_permissionscan_order_det_set_deposit.AsBoolean;
  act_set_loaded.Enabled := dtm_login.qry_permissionscan_order_det_set_loaded.AsBoolean;
  act_set_payed.Enabled :=
    dtm_login.qry_permissionscan_order_det_set_payed_all.AsBoolean;
  act_set_vn.Enabled := dtm_login.qry_permissionscan_order_det_set_vin.AsBoolean;
end;

procedure Tfrm_order_detail_edit.act_set_payedExecute(Sender: TObject);
begin
  dtm.qry_order_detailspayed_all.AsBoolean := True;
end;

procedure Tfrm_order_detail_edit.protect_fields(protect: boolean);
begin
  edt_vin.ReadOnly := protect;
  edt_deposit.ReadOnly := protect;
end;

end.
