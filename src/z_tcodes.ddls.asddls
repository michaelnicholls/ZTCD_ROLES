@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TCODES in roles'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@UI.headerInfo.typeNamePlural: 'Roles'
@Search.searchable: true
define view entity Z_TCODES as select distinct from  ust12
association to Z_ROLE_INFO as _role_info on $projection.Auth = _role_info.auth

{
@UI.hidden: true
   key objct as Objct,
   @UI.hidden: true
   

   
   key auth as Auth,
   @UI.lineItem: [{ position: 10 }]
 
   @UI.selectionField: [{position: 10}]
 
   key cast(von as tcode) as tcode,
 //  key bis as Bis ,
  @UI.lineItem: [{ position: 20 , label: 'Role (right-click to launch in new window)', type: #WITH_URL, url: 'webgui'}]
   @Search.defaultSearchElement: true
   @Search.fuzzinessThreshold: 0.8
   
     _role_info.agr_name as role,
   @UI.lineItem: [{ position: 30 , label: 'Parent role'}]
 
   @Search.defaultSearchElement: true
   @Search.fuzzinessThreshold: 0.8
  
   _role_info.parent_agr as parent,
    @UI.lineItem: [{ position: 50 , label: 'Derived'}]
     @UI.selectionField: [{position: 30}]
   _role_info.Derived as Derived,
    @UI.selectionField: [{position: 40}]
     @UI.lineItem: [{ position: 60 , label: 'SAP Supplied'}]
   _role_info.SAP_supplied,
     @UI.lineItem: [{ position: 70 , label: 'Description'}]
      @Search.defaultSearchElement: true
   @Search.fuzzinessThreshold: 0.8
   _role_info.description,
   @UI.hidden: true
   _role_info.webgui as webgui,
    @UI.lineItem: [{ position: 40 , label: 'Imparting'}]

    @UI.selectionField: [{position: 20}]
  //@Consumption.valueHelpDefinition: [{ entity: { name: 'Z_IMPARTING_VALUES', element: ''}, distinctValues: true}]
   _role_info.Imparting as Imparting,
      @UI.lineItem: [{ position: 65 , label: 'In composite'}]

    @UI.selectionField: [{position: 40}]
   _role_info.in_composite
   
   
  
  
} where objct = 'S_TCODE' and _role_info.agr_name <> ''
//group by objct,auth,von, _role_info.agr_name,_role_info.parent_agr, _role_info.Derived,_role_info.SAP_supplied,_role_info.description,_role_info.webgui,_role_info.Imparting
