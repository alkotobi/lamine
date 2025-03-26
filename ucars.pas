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
    DBGrid1: TDBGrid;
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

end.
