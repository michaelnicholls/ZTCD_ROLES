@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'role info'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ROLE_INFO as select from agr_define
association to agr_1251 as _agr_1251 on $projection.agr_name = _agr_1251.agr_name

{
    agr_name,
    parent_agr,
    case parent_agr
    when '' then ''
    else 'X'
    end as derived,
    case when left(agr_name,4) = 'SAP_' then 'X'
    else ''
    end as SAP_supplied,
    _agr_1251.auth as auth
}
