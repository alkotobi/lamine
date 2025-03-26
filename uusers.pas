unit uusers;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, DBCtrls;

type

  { Tfrm_users }

  Tfrm_users = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dts_users: TDataSource;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frm_users: Tfrm_users;

implementation

{$R *.lfm}

{ Tfrm_users }
uses udtm_main;
procedure Tfrm_users.FormCreate(Sender: TObject);
begin
  dtm.qry_users.Open;
end;

end.

