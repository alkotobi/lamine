unit ucars;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBCtrls,
  DBGrids, StdCtrls, udtm_main;

type

  { Tfrm_cars }

  Tfrm_cars = class(TForm)
    dts_brands: TDataSource;
    dts_cars: TDataSource;
    dts_models: TDataSource;
    grd_brand: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    procedure DBMemo1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure grd_brandExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frm_cars: Tfrm_cars;

implementation

{$R *.lfm}

{ Tfrm_cars }

procedure Tfrm_cars.FormCreate(Sender: TObject);
begin
  with dtm do
  begin
    qry_brands.Open;
    qry_car_names.Open;
    qry_car_models.Open;

  end;
end;

procedure Tfrm_cars.grd_brandExit(Sender: TObject);
var
  grd: TDBGrid;
begin
  grd := TDBGrid(Sender);
  if (grd.DataSource.DataSet.State = dsedit) or
    (grd.DataSource.DataSet.State = dsInsert) then
  begin
    try
      grd.DataSource.DataSet.post;

    except
      on e: Exception do
      begin
        ShowMessage(e.Message);
        grd.SetFocus;
        Abort;
      end;
    end;
  end;
end;

procedure Tfrm_cars.DBMemo1Exit(Sender: TObject);
begin

  if (DBMemo1.DataSource.DataSet.State = dsedit) or
    (DBMemo1.DataSource.DataSet.State = dsInsert) then
  begin

    try
      DBMemo1.DataSource.DataSet.post;

    except
      on e: Exception do
      begin
        ShowMessage(e.Message);
        DBMemo1.SetFocus;
        Abort;
      end;
    end;
  end;
end;

procedure Tfrm_cars.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if (dtm.qry_brands.State in dsEditModes) or
    (dtm.qry_car_names.State in dsEditModes) or
    (dtm.qry_car_models.State in dsEditModes)
    then
    begin
      showMessage('there is modifications needs to be saved first');
      CloseAction:=TCloseAction.caNone;
    end;
end;



end.
