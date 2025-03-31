unit udtm_main;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Menus,StrUtils, DB,udtm, Uni, BGRAImageList, BGRASVGImageList;

type

  { Tdtm }

  Tdtm = class(TDataModule)
    BGRAImageList1: TBGRAImageList;
    BGRASVGImageList1: TBGRASVGImageList;
    car_brand1: TWideStringField;
    car_name1: TWideStringField;
    city_name: TWideStringField;
    country_name: TWideStringField;
    dts_cars_order: TDataSource;
    dts_order: TDataSource;
    dts_groups: TDataSource;
    dts_car_name: TDataSource;
    dts_brand: TDataSource;
    group_name: TWideStringField;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    model: TWideStringField;
    name_broker: TWideStringField;
    name_city: TWideStringField;
    name_city_cmp: TWideStringField;
    name_city_from: TWideStringField;
    name_city_to: TWideStringField;
    name_company: TWideStringField;
    name_owner: TWideStringField;
    name_owner1: TWideStringField;
    name_owner2: TWideStringField;
    name_supplier: TWideStringField;
    name_supplier1: TWideStringField;
    name_supplier2: TWideStringField;
    name_supplier_achat: TWideStringField;
    order_details_client_name: TWideStringField;
    qry_brandsbrand: TWideStringField;
    qry_brandsid: TLargeintField;
    qry_brokerbroker: TWideStringField;
    qry_brokerid: TLargeintField;
    qry_cars_stockdate_of_delivery2: TDateField;
    qry_cars_stockdate_of_production2: TDateField;
    qry_cars_stockdate_ordered2: TDateField;
    qry_cars_stockfreight2: TFloatField;
    qry_cars_stockid2: TLargeintField;
    qry_cars_stockid_car_model2: TLongintField;
    qry_cars_stockid_color2: TLongintField;
    qry_cars_stockid_order_achat2: TLongintField;
    qry_cars_stockid_order_vente2: TLongintField;
    qry_cars_stockid_owner2: TLongintField;
    qry_cars_stockid_supplier2: TLongintField;
    qry_cars_stockkm2: TLongintField;
    qry_cars_stockprice_achat2: TFloatField;
    qry_cars_stockprice_usd2: TFloatField;
    qry_cars_stockship_from_id_city2: TLongintField;
    qry_cars_stockship_to_id_city2: TLongintField;
    qry_cars_stocktaken2: TBooleanField;
    qry_cars_stockvin2: TWideStringField;
    qry_order_details: TUniQuery;
    qry_cars_stockdate_of_delivery: TDateField;
    qry_cars_stockdate_of_delivery1: TDateField;
    qry_cars_stockdate_of_production: TDateField;
    qry_cars_stockdate_of_production1: TDateField;
    qry_cars_stockdate_ordered: TDateField;
    qry_cars_stockdate_ordered1: TDateField;
    qry_cars_stockfreight: TFloatField;
    qry_cars_stockfreight1: TFloatField;
    qry_cars_stockid: TLargeintField;
    qry_cars_stockid1: TLargeintField;
    qry_cars_stockid_car_model: TLongintField;
    qry_cars_stockid_car_model1: TLongintField;
    qry_cars_stockid_color: TLongintField;
    qry_cars_stockid_color1: TLongintField;
    qry_cars_stockid_order_achat: TLongintField;
    qry_cars_stockid_order_achat1: TLongintField;
    qry_cars_stockid_order_vente: TLongintField;
    qry_cars_stockid_order_vente1: TLongintField;
    qry_cars_stockid_owner: TLongintField;
    qry_cars_stockid_owner1: TLongintField;
    qry_cars_stockid_supplier: TLongintField;
    qry_cars_stockid_supplier1: TLongintField;
    qry_cars_stockkm: TLongintField;
    qry_cars_stockkm1: TLongintField;
    qry_cars_stockloaded: TFloatField;
    qry_cars_stockprice_achat: TFloatField;
    qry_cars_stockprice_achat1: TFloatField;
    qry_cars_stockprice_usd: TFloatField;
    qry_cars_stockprice_usd1: TFloatField;
    qry_cars_stockship_from_id_city: TLongintField;
    qry_cars_stockship_from_id_city1: TLongintField;
    qry_cars_stockship_to_id_city: TLongintField;
    qry_cars_stockship_to_id_city1: TLongintField;
    qry_cars_stocktaken: TBooleanField;
    qry_cars_stocktaken1: TBooleanField;
    qry_cars_stockvin: TWideStringField;
    qry_cars_stockvin1: TWideStringField;
    qry_car_modelsid: TLargeintField;
    qry_car_modelsid1: TLargeintField;
    qry_car_modelsid_car_name: TLongintField;
    qry_car_modelsid_car_name1: TLongintField;
    qry_car_modelsmodel: TWideStringField;
    qry_car_modelsmodel1: TWideStringField;
    qry_car_modelsnotes: TWideMemoField;
    qry_car_modelsnotes1: TWideMemoField;
    qry_car_namesid: TLargeintField;
    qry_car_namesid1: TLargeintField;
    qry_car_namesid_brand: TLongintField;
    qry_car_namesid_brand1: TLongintField;
    qry_car_namesname: TWideStringField;
    qry_car_namesname1: TWideStringField;
    qry_cities_alg: TUniQuery;
    qry_citiesid: TLargeintField;
    qry_citiesid_country: TLongintField;
    qry_citiesname: TWideStringField;
    qry_citiespostal_code: TWideStringField;
    qry_cities_cn: TUniQuery;
    qry_cities_algid: TLargeintField;
    qry_cities_algid1: TLargeintField;
    qry_cities_algname: TWideStringField;
    qry_cities_algname1: TWideStringField;
    qry_clientscedit: TFloatField;
    qry_clientsdoor_no: TWideStringField;
    qry_clientsid: TLargeintField;
    qry_clientsid_city: TLongintField;
    qry_clientsid_country: TLongintField;
    qry_clientsname: TWideStringField;
    qry_clientsneiberhood: TWideStringField;
    qry_clientspostal_code: TWideStringField;
    qry_clientsstreet: TWideStringField;
    qry_colorscolor: TWideStringField;
    qry_colorsid: TLargeintField;
    qry_companiesaddress: TWideStringField;
    qry_companiesid: TLargeintField;
    qry_companiesid_city: TLongintField;
    qry_companiesname: TWideStringField;
    qry_countriesid: TLargeintField;
    qry_countriesname: TWideStringField;
    qry_count_zero: TUniQuery;
    qry_count_zerocount_zero_users: TLargeintField;
    qry_orderdate: TDateField;
    qry_orderid: TLargeintField;
    qry_orderid_broker: TLongintField;
    qry_orderref: TWideStringField;
    qry_ordervirsement: TFloatField;
    qry_order_achatamount: TFloatField;
    qry_order_achatdate: TDateField;
    qry_order_achatdelivery_to_port_date: TDateField;
    qry_order_achatdeposit: TFloatField;
    qry_order_achatid: TLargeintField;
    qry_order_achatid_supplier: TLongintField;
    qry_order_achatsupp_get_cars_date: TDateField;
    qry_order_achatvin_get_date: TDateField;
    qry_order_achat_details: TUniQuery;
    qry_order_achat_detailsdate_of_delivery: TDateField;
    qry_order_achat_detailsdate_of_production: TDateField;
    qry_order_achat_detailsdate_ordered: TDateField;
    qry_order_achat_detailsfreight: TFloatField;
    qry_order_achat_detailsid: TLargeintField;
    qry_order_achat_detailsid_car_model: TLongintField;
    qry_order_achat_detailsid_color: TLongintField;
    qry_order_achat_detailsid_order_achat: TLongintField;
    qry_order_achat_detailsid_order_vente: TLongintField;
    qry_order_achat_detailsid_owner: TLongintField;
    qry_order_achat_detailsid_supplier: TLongintField;
    qry_order_achat_detailskm: TLongintField;
    qry_order_achat_detailsloaded: TFloatField;
    qry_order_achat_detailsprice_achat: TFloatField;
    qry_order_achat_detailsprice_usd: TFloatField;
    qry_order_achat_detailsship_from_id_city: TLongintField;
    qry_order_achat_detailsship_to_id_city: TLongintField;
    qry_order_achat_detailstaken: TBooleanField;
    qry_order_achat_detailsvin: TWideStringField;
    qry_cars_stock: TUniQuery;
    qry_order_detailscolor: TWideStringField;
    qry_order_detailsdate_of_delivery: TDateField;
    qry_order_detailsdate_of_production: TDateField;
    qry_order_detailsdate_ordered: TDateField;
    qry_order_detailsdeposit_from_client: TFloatField;
    qry_order_detailsdeposit_from_client1: TFloatField;
    qry_order_detailsdeposit_to_supplier: TFloatField;
    qry_order_detailsdeposit_to_supplier1: TFloatField;
    qry_order_detailsdeposit_USD: TFloatField;
    qry_order_detailsfrieght_usd: TFloatField;
    qry_order_detailsid: TLargeintField;
    qry_order_detailsid_car_model: TLongintField;
    qry_order_detailsid_client: TLongintField;
    qry_order_detailsid_color: TLongintField;
    qry_order_detailsid_order: TLongintField;
    qry_order_detailskm: TLongintField;
    qry_order_detailsloaded: TBooleanField;
    qry_order_detailsloaded1: TBooleanField;
    qry_order_detailspayed_all: TBooleanField;
    qry_order_detailspayed_from_client: TBooleanField;
    qry_order_detailspayed_from_client1: TBooleanField;
    qry_order_detailspayed_to_supplier: TBooleanField;
    qry_order_detailspayed_to_supplier1: TBooleanField;
    qry_order_detailsprice_usd: TFloatField;
    qry_order_detailsrate: TFloatField;
    qry_order_detailsrate1: TCurrencyField;
    qry_order_detailsship_from_id_city: TLongintField;
    qry_order_detailsship_to_id_city: TLongintField;
    qry_order_detailsvin: TWideStringField;
    qry_suppliersaddress: TWideStringField;
    qry_suppliersid: TLargeintField;
    qry_suppliersid_city: TLongintField;
    qry_suppliersid_company: TLongintField;
    qry_suppliersmobile: TWideStringField;
    qry_suppliersname: TWideStringField;
    qry_supplierswechat: TWideStringField;
    qry_supplierswhatsapp: TWideStringField;
    qry_transactionsamount: TFloatField;
    qry_transactionsamount_received: TFloatField;
    qry_transactionsamount_usd: TCurrencyField;
    qry_transactionsdate_receive: TDateField;
    qry_transactionsdate_send: TDateField;
    qry_transactionsdate_will_send: TDateField;
    qry_transactionsid: TLargeintField;
    qry_transactionsid_client: TLongintField;
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
    qry_car_info: TUniQuery;
    qry_car_infocar_info: TWideStringField;
    qry_car_infomodel_id: TLargeintField;
    qry_broker: TUniQuery;
    qry_order: TUniQuery;
    qry_colors: TUniQuery;
    qry_order_achat: TUniQuery;
    qry_suppliers: TUniQuery;
    qry_companies: TUniQuery;
    procedure qry_car_modelsAfterPost(DataSet: TDataSet);
    procedure qry_citiesAfterPost(DataSet: TDataSet);
    procedure qry_colorscolorSetText(Sender: TField; const aText: string);
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

procedure Tdtm.qry_colorscolorSetText(Sender: TField; const aText: string);
begin
    Sender.AsString := UpperCase(aText);
end;

procedure Tdtm.qry_car_modelsAfterPost(DataSet: TDataSet);
begin
  qry_car_info.Refresh;
end;

procedure Tdtm.qry_citiesAfterPost(DataSet: TDataSet);
begin
  qry_cities_alg.Refresh;
  qry_cities_cn.Refresh;
end;

end.

