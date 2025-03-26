program lamine;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Controls, umain, ulogin, udtm, unidac10, liteprovider10, myprovider10,
  udtm_main, upermissions, uchange_pass, uusers, utransactions, ustart,
  utransfer, utreceive, ucars
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(Tdtm_login, dtm_login);
  frm_login := Tfrm_login.Create(Application);
   if frm_login.ShowModal <> mrOK then
   begin
       Application.Terminate;
   end;
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tdtm, dtm);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(Tfrm_groups, frm_groups);
  Application.CreateForm(Tfrm_change_pass, frm_change_pass);
  Application.CreateForm(Tfrm_receive, frm_receive);
  Application.CreateForm(Tfrm_transfer, frm_transfer);
  Application.CreateForm(Tfrm_start, frm_start);
  Screen.Cursor := crDefault;

  Application.Run;
end.

