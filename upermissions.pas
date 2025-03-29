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
    can_confirm_10: TDBCheckBox;
    can_confirm_11: TDBCheckBox;
    can_confirm_12: TDBCheckBox;
    can_confirm_13: TDBCheckBox;
    can_confirm_2: TDBCheckBox;
    can_confirm_3: TDBCheckBox;
    can_confirm_4: TDBCheckBox;
    can_confirm_5: TDBCheckBox;
    can_confirm_6: TDBCheckBox;
    can_confirm_7: TDBCheckBox;
    can_confirm_8: TDBCheckBox;
    can_confirm_9: TDBCheckBox;
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

