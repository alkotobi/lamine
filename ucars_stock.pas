unit ucars_stock;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, DBCtrls,
  ExtCtrls, StdCtrls, Buttons, Uni, udtm_main;

type

  { Tfrm_cars_stock }

  Tfrm_cars_stock = class(TForm)
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dts_car_stock: TDataSource;
    edt_car_filter: TEdit;
    edt_vin_filter: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure edt_car_filterChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public
    id_order: integer;
  end;

var
  frm_cars_stock: Tfrm_cars_stock;

implementation

{$R *.lfm}

{ Tfrm_cars_stock }
uses uorder_det_edit;
procedure Tfrm_cars_stock.FormActivate(Sender: TObject);
begin
  dtm.qry_cars_stock.Filter := 'taken = false';
  dtm.qry_cars_stock.Filtered := True;
end;

procedure Tfrm_cars_stock.edt_car_filterChange(Sender: TObject);
begin
  dtm.qry_cars_stock.Filter := 'taken = false ';
  if edt_car_filter.Text <> '' then
    dtm.qry_cars_stock.Filter :=
      dtm.qry_cars_stock.Filter + ' car_info like %' + edt_car_filter.Text + '%';
  if edt_car_filter.Text <> '' then
    dtm.qry_cars_stock.Filter :=
      dtm.qry_cars_stock.Filter + ' vin like %' + edt_vin_filter.Text + '%';
  dtm.qry_cars_stock.Filtered := True;
end;

procedure Tfrm_cars_stock.BitBtn1Click(Sender: TObject);
begin
  dtm.qry_cars_stock.edit;
  dtm.qry_cars_stock.FieldByName('id_order_vente').AsInteger:=id_order;
  dtm.qry_cars_stock.FieldByName('taken').AsBoolean:=true;
  dtm.qry_cars_stock.Post;
  dtm.qry_order_details.Refresh;
  dtm.qry_order_details.FindKey([dtm.qry_cars_stock.FieldByName('id').AsInteger]);
  dtm.qry_order_details.Edit;
  if not Assigned(frm_order_detail_edit) then
    begin
     Application.CreateForm(tfrm_order_detail_edit,frm_order_detail_edit);
    end;
  frm_order_detail_edit.is_new_car:=true;
  close;
  frm_order_detail_edit.ShowModal;

end;

procedure Tfrm_cars_stock.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  dtm.qry_cars_stock.Filtered := False;
end;

procedure Tfrm_cars_stock.FormCreate(Sender: TObject);
begin
  dtm.qry_cars_stock.Open;
end;

end.
