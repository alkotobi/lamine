unit upermissions;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, DBCtrls,
  ExtCtrls, StdCtrls,udtm_main;

type

  { Tfrm_groups }

  Tfrm_groups = class(TForm)
    btn_save: TButton;
    btn_cancel: TButton;
    can_confirm_: TDBCheckBox;
    can_confirm_1: TDBCheckBox;
    can_confirm_2: TDBCheckBox;
    can_confirm_3: TDBCheckBox;
    can_confirm_4: TDBCheckBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dts_permissions: TDataSource;
    dts_groups: TDataSource;
    Panel1: TPanel;
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
  private

  public

  end;

var
  frm_groups: Tfrm_groups;

implementation

{$R *.lfm}

{ Tfrm_groups }

procedure Tfrm_groups.btn_cancelClick(Sender: TObject);
begin
  dts_permissions.DataSet.Cancel;
  close;
end;

procedure Tfrm_groups.btn_saveClick(Sender: TObject);
begin
  dts_permissions.DataSet.Post;
  ShowMessage('changes applied');
end;

end.

