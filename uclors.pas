unit uclors;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, udtm_main, Forms, Controls, Graphics, Dialogs, DBGrids,
  DBCtrls;

type

  { Tfrm_colors }

  Tfrm_colors = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dts_colors: TDataSource;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frm_colors: Tfrm_colors;

implementation

{$R *.lfm}

{ Tfrm_colors }

procedure Tfrm_colors.FormCreate(Sender: TObject);
begin
  dtm.qry_colors.Open;
end;

end.

