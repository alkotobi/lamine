unit ucities;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, DBCtrls,
  udtm_main;

type

  { Tfrm_cities }

  Tfrm_cities = class(TForm)
    dts_cities: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frm_cities: Tfrm_cities;

implementation

{$R *.lfm}

{ Tfrm_cities }

procedure Tfrm_cities.FormCreate(Sender: TObject);
begin
   dtm.qry_cities.Open;
end;

procedure Tfrm_cities.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if dtm.qry_cities.State in dsEditModes then
  begin
    showMessage('there is unsaved data; please save first');
    CloseAction:= TCloseAction.caNone;
  end;
end;

end.

