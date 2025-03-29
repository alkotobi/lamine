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
    BitBtn1: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn2: TBitBtn;
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
    edt_deposit: TDBEdit;
    dts_cities: TDataSource;
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
    procedure ActionList1Update(AAction: TBasicAction; var Handled: Boolean);
    procedure act_set_depositExecute(Sender: TObject);
    procedure act_set_loadedExecute(Sender: TObject);
    procedure act_set_payedExecute(Sender: TObject);
    procedure act_set_vnExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure protect_fields(protect:boolean);
  private

  public

  end;

var
  frm_order_detail_edit: Tfrm_order_detail_edit;

implementation

{$R *.lfm}

{ Tfrm_order_detail_edit }
  uses udtm;
procedure Tfrm_order_detail_edit.BitBtn2Click(Sender: TObject);
begin
  dtm.qry_order_details.Cancel;
  close;
end;

procedure Tfrm_order_detail_edit.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
   dtm.qry_order_details.Cancel;
   protect_fields(true);
end;

procedure Tfrm_order_detail_edit.BitBtn1Click(Sender: TObject);
begin
  dtm.qry_order_details.Post;
  protect_fields(true);
  close;
end;

procedure Tfrm_order_detail_edit.act_set_vnExecute(Sender: TObject);
begin
  edt_vin.ReadOnly:=false;
  edt_vin.SetFocus;
end;

procedure Tfrm_order_detail_edit.act_set_loadedExecute(Sender: TObject);
begin
  dtm.qry_order_detailsloaded.AsBoolean:=true;
end;

procedure Tfrm_order_detail_edit.act_set_depositExecute(Sender: TObject);
begin
  edt_deposit.ReadOnly:=false;
  edt_deposit.SetFocus;
end;

procedure Tfrm_order_detail_edit.ActionList1Update(AAction: TBasicAction;
  var Handled: Boolean);
begin
  act_set_deposit.Enabled:=dtm_login.qry_permissionscan_order_det_set_deposit.AsBoolean;
  act_set_loaded.Enabled:=dtm_login.qry_permissionscan_order_det_set_loaded.AsBoolean;
  act_set_payed.Enabled:=dtm_login.qry_permissionscan_order_det_set_payed_all.AsBoolean;
  act_set_vn.Enabled:=dtm_login.qry_permissionscan_order_det_set_vin.AsBoolean;
end;

procedure Tfrm_order_detail_edit.act_set_payedExecute(Sender: TObject);
begin
  dtm.qry_order_detailspayed_all.AsBoolean:=true;
end;

procedure Tfrm_order_detail_edit.protect_fields(protect:boolean);
begin
 edt_vin.ReadOnly := protect;
 edt_deposit.ReadOnly:=protect;
end;

end.

