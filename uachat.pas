unit uachat;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { Tfrm_achat }

  Tfrm_achat = class(TForm)
    btn_client2: TBitBtn;
    btn_edit_order: TBitBtn;
    btn_new_order: TBitBtn;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
  private

  public

  end;

var
  frm_achat: Tfrm_achat;

implementation

{$R *.lfm}

end.

