unit uorder_det_edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBCtrls, DBExtCtrls, Buttons, udtm_main;

type

  { Tfrm_order_detail_edit }

  Tfrm_order_detail_edit = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  frm_order_detail_edit: Tfrm_order_detail_edit;

implementation

{$R *.lfm}

{ Tfrm_order_detail_edit }

procedure Tfrm_order_detail_edit.BitBtn2Click(Sender: TObject);
begin
  dtm.qry_order_details.Cancel;
  close;
end;

procedure Tfrm_order_detail_edit.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
   dtm.qry_order_details.Cancel;
end;

procedure Tfrm_order_detail_edit.BitBtn1Click(Sender: TObject);
begin
  dtm.qry_order_details.Post;
  close;
end;

end.

