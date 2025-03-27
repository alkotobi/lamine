unit udtm_main;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Menus, DB,udtm, Uni;

type

  { Tdtm }

  Tdtm = class(TDataModule)
    car_brand: TWideStringField;
    car_name: TWideStringField;
    city_name: TWideStringField;
    client_name: TWideStringField;
    country_name: TWideStringField;
    dts_order: TDataSource;
    dts_groups: TDataSource;
    dts_car_name: TDataSource;
    dts_brand: TDataSource;
    group_name: TWideStringField;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    order_details_client_name: TWideStringField;
    qry_car_modelsid: TLargeintField;
    qry_car_modelsid_car_name: TLongintField;
    qry_car_modelsmodel: TWideStringField;
    qry_car_modelsnotes: TWideMemoField;
    qry_car_namesbrand_name: TStringField;
    qry_car_namesid: TLargeintField;
    qry_car_namesid_brand: TLongintField;
    qry_car_namesname: TWideStringField;
    qry_citiesid: TLargeintField;
    qry_citiesname: TWideStringField;
    qry_citiespostal_code: TWideStringField;
    qry_clientscedit: TFloatField;
    qry_clientsdoor_no: TWideStringField;
    qry_clientsid: TLargeintField;
    qry_clientsid_city: TLongintField;
    qry_clientsid_country: TLongintField;
    qry_clientsname: TWideStringField;
    qry_clientsneiberhood: TWideStringField;
    qry_clientspostal_code: TWideStringField;
    qry_clientsstreet: TWideStringField;
    qry_countriesid: TLargeintField;
    qry_countriesname: TWideStringField;
    qry_count_zero: TUniQuery;
    qry_count_zerocount_zero_users: TLargeintField;
    qry_orderdate: TDateField;
    qry_orderid: TLargeintField;
    qry_orderid_client: TLongintField;
    qry_orderref: TWideStringField;
    qry_ordervirsement: TFloatField;
    qry_order_details: TUniQuery;
    qry_order_detailscolor: TLongintField;
    qry_order_detailsdate_of_delivery: TDateField;
    qry_order_detailsdate_of_production: TDateField;
    qry_order_detailsdate_ordered: TDateField;
    qry_order_detailsfrieght_usd: TFloatField;
    qry_order_detailsid: TLargeintField;
    qry_order_detailsid_car_model: TLongintField;
    qry_order_detailsid_client: TLongintField;
    qry_order_detailsid_order: TLongintField;
    qry_order_detailskm: TLongintField;
    qry_order_detailsprice_usd: TFloatField;
    qry_order_detailsrate: TFloatField;
    qry_order_detailsship_from_id_city: TLongintField;
    qry_order_detailsship_to_id_city: TLongintField;
    qry_order_detailsvin: TWideStringField;
    qry_transactionsamount: TFloatField;
    qry_transactionsamount_received: TFloatField;
    qry_transactionsamount_usd: TCurrencyField;
    qry_transactionsdate_receive: TDateField;
    qry_transactionsdate_send: TDateField;
    qry_transactionsdate_will_send: TDateField;
    qry_transactionsid: TLargeintField;
    qry_transactionsid_user_receive: TLongintField;
    qry_transactionsid_user_send: TLongintField;
    qry_transactionsid_user_will_send: TLongintField;
    qry_transactionsrate: TFloatField;
    qry_transactionsreceive_notes: TWideMemoField;
    qry_transactionssend_notess: TWideMemoField;
    qry_transactionswill_send_notes: TWideMemoField;
    qry_users: TUniQuery;
    qry_permissionns: TUniQuery;
    qry_groups: TUniQuery;
    qry_transactions: TUniQuery;
    qry_usersactive: TBooleanField;
    qry_usersid: TLargeintField;
    qry_usersid_group: TLongintField;
    qry_usersname: TWideStringField;
    qry_userspassword: TWideStringField;
    qry_brands: TUniQuery;
    qry_car_names: TUniQuery;
    qry_car_models: TUniQuery;
    qry_id_pictures: TUniQuery;
    qry_clients: TUniQuery;
    qry_cities: TUniQuery;
    qry_countries: TUniQuery;
    qry_order: TUniQuery;
    procedure qry_car_namesCalcFields(DataSet: TDataSet);
    procedure qry_transactionsCalcFields(DataSet: TDataSet);
  private

  public

  end;
const
  can_change_groups='can_change_groups';
  can_change_users = 'can_change_users';
  can_confirm_receive='can_confirm_receive';
  can_confirm_send='can_confirm_send';
  can_confirm_will_send='can_confirm_will_send';
  id_user_will_send='id_user_will_send';
  date_will_send='date_will_send';
  will_send_notes='will_send_notes';
  id_user_send='id_user_send';
  date_send='date_send';
  send_notes='send_notes';
  id_user_receive='id_user_receive';
  date_receive='date_receive';
  amount_received='amount_received';
  receive_notes='receive_notes';
var
  dtm: Tdtm;

implementation

{$R *.lfm}

{ Tdtm }

procedure Tdtm.qry_transactionsCalcFields(DataSet: TDataSet);
begin
  if qry_transactionsrate.AsCurrency<>0 then
  begin
    qry_transactionsamount_usd.AsCurrency:= qry_transactionsamount.AsCurrency/qry_transactionsrate.AsCurrency;
  end;
end;

procedure Tdtm.qry_car_namesCalcFields(DataSet: TDataSet);
begin
  qry_car_namesbrand_name.AsString:= qry_car_names.FieldByName('brand').AsString
  +' '+qry_car_namesname.AsString;
end;

end.

