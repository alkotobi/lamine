unit udtm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Uni, SQLiteUniProvider, MySQLUniProvider, MemData,
  DBAccess, Dialogs;

type

  { Tdtm_login }

  Tdtm_login = class(TDataModule)
    conn: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    qry_groups: TUniQuery;
    qry_permissionscan_change_groups: TBooleanField;
    qry_permissionscan_change_users: TBooleanField;
    qry_permissionscan_confirm_receive: TBooleanField;
    qry_permissionscan_confirm_send: TBooleanField;
    qry_permissionscan_confirm_will_send: TBooleanField;
    qry_permissionscan_order_c: TBooleanField;
    qry_permissionscan_order_det_edit: TBooleanField;
    qry_permissionscan_order_det_new: TBooleanField;
    qry_permissionscan_order_det_set_deposit: TBooleanField;
    qry_permissionscan_order_det_set_loaded: TBooleanField;
    qry_permissionscan_order_det_set_payed_all: TBooleanField;
    qry_permissionscan_order_det_set_vin: TBooleanField;
    qry_permissionscan_order_edit: TBooleanField;
    qry_permissionscan_order_new: TBooleanField;
    qry_permissionsid: TLargeintField;
    qry_permissionsid_group: TLongintField;
    qry_users: TUniQuery;
    qry_permissions: TUniQuery;
    SQLiteUniProvider1: TSQLiteUniProvider;
    procedure connConnectionLost(Sender: TObject; Component: TComponent;
      ConnLostCause: TConnLostCause; var RetryMode: TRetryMode);
  private

  public

  end;

var
  dtm_login: Tdtm_login;

implementation

{$R *.lfm}

{ Tdtm_login }

procedure Tdtm_login.connConnectionLost(Sender: TObject; Component: TComponent;
  ConnLostCause: TConnLostCause; var RetryMode: TRetryMode);
begin
  showMessage('connection lost');
  RetryMode := TRetryMode.rmReconnect;
end;

end.

