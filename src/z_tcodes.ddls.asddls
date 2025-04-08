@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'TCODES in roles'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@Search.searchable: true

@UI.headerInfo.typeNamePlural: 'Roles'
@OData.publish: true
define view entity Z_TCODES
  as select distinct from ust12

    inner join            Z_ROLE_INFO on Z_ROLE_INFO.auth = ust12.auth
    inner join tstct on tstct.tcode = ust12.von and tstct.sprsl = $session.system_language

{
      @UI.hidden: true
  key ust12.objct               as Objct,

      @UI.hidden: true
  key ust12.auth                as Auth,

      @UI.lineItem: [ { position: 10 } ]
      @UI.selectionField: [ { position: 10 } ]

  key cast(ust12.von as tcode)  as tcode,

      //  key bis as Bis ,
      @UI.lineItem: [ { position: 20, label: 'Role' } ]
  //     @Search.defaultSearchElement: true
  //     @Search.fuzzinessThreshold: 0.8

  key Z_ROLE_INFO.fullname     as role,

  //    @UI.lineItem: [ { position: 40 } ]
      @UI.selectionField: [ { position: 20 } ]
      Z_ROLE_INFO.composite,

 //     @Search.defaultSearchElement: true
 //     @Search.fuzzinessThreshold: 0.8
      @UI.lineItem: [ { position: 60, label: 'Derived from' } ]

      Z_ROLE_INFO.parent_agr    as parent,

      @UI.lineItem: [ { position: 80 } ]
      @UI.selectionField: [ { position: 30 } ]
      Z_ROLE_INFO.Derived       as Derived,

      @UI.lineItem: [ { position: 100 } ]
      @UI.selectionField: [ { position: 40 } ]
      Z_ROLE_INFO.SAP_supplied,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @UI.lineItem: [ { position: 30, label: 'Description' } ]
      Z_ROLE_INFO.description,

      @UI.hidden: true
      Z_ROLE_INFO.webgui        as webgui,

      @UI.lineItem: [ { position: 70 } ]
      @UI.selectionField: [ { position: 25 } ]
      // @Consumption.valueHelpDefinition: [{ entity: { name: 'Z_IMPARTING_VALUES', element: ''}, distinctValues: true}]
      Z_ROLE_INFO.Imparting     as Imparting,

      @UI.lineItem: [ { position: 90 } ]
      @UI.selectionField: [ { position: 40 } ]
      Z_ROLE_INFO.in_composite,

      @UI.lineItem: [ { position: 50, label: 'Right click to launch PFCG', type: #WITH_URL, url: 'webgui' } ]
      'PFCG'                    as pfcg,
      @UI.lineItem: [ { position: 15 } ]
      tstct.ttext as tcode_description
}

where ust12.objct = 'S_TCODE' and Z_ROLE_INFO.agr_name <> ''
//group by objct,auth,von, _role_info.agr_name,_role_info.parent_agr, _role_info.Derived,_role_info.SAP_supplied,_role_info.description,_role_info.webgui,_role_info.Imparting
