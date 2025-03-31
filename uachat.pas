unit uachat;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  ActnList;

type

  { Tfrm_achat }

  Tfrm_achat = class(TForm)
    act_edit_cars: TAction;
    act_edit_order: TAction;
    act_new_cars: TAction;
    act_new_order: TAction;
    ActionList1: TActionList;
    DBGrid2: TDBGrid;
    dts_achat_det: TDataSource;
    dts_achat: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
  private

  public

  end;

var
  frm_achat: Tfrm_achat;

implementation

{$R *.lfm}

end.

