unit ucountries;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, DBCtrls,
  udtm_main;

type

  { Tfrm_countries }

  Tfrm_countries = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dts_countries: TDataSource;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frm_countries: Tfrm_countries;

implementation

{$R *.lfm}

{ Tfrm_countries }

procedure Tfrm_countries.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  if dtm.qry_countries.State in dsEditModes then
  begin
    ShowMessage('there is modifications need to be saved');
    CloseAction:= TCloseAction.caNone;
  end;
end;

procedure Tfrm_countries.FormCreate(Sender: TObject);
begin
   dtm.qry_countries.Open;
end;

end.

