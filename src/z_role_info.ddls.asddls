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
association to agr_texts as _agr_texts on $projection.agr_name = _agr_texts.agr_name
    and _agr_texts.spras = $session.system_language
    and _agr_texts.line = '00000'

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
    _agr_1251.auth as auth,
    _agr_texts.text as description
}
