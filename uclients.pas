unit uclients;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, ExtCtrls,
  StdCtrls, Buttons, DBCtrls, udtm_main;

type

  { Tfrm_clients }

  Tfrm_clients = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dts_clients: TDataSource;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frm_clients: Tfrm_clients;

implementation

{$R *.lfm}

{ Tfrm_clients }

procedure Tfrm_clients.FormCreate(Sender: TObject);
begin
  with dtm do
  begin
    qry_cities.Open;
    qry_countries.open;
    qry_clients.open;

  end;
end;

procedure Tfrm_clients.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  if dtm.qry_clients.State in dsEditModes then
  begin
    showMessage('there is unsaved data; please save first');
    CloseAction:= TCloseAction.caNone;
  end;
end;

end.
