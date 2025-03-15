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
left outer join z_imparting_roles as imp on imp.parent = agr_define.agr_name
association to agr_1251 as _agr_1251 on $projection.agr_name = _agr_1251.agr_name
association to agr_texts as _agr_texts on $projection.agr_name = _agr_texts.agr_name
    and _agr_texts.spras = $session.system_language
    and _agr_texts.line = '00000'

{
    agr_define.agr_name,
    agr_define.parent_agr,
    case agr_define.parent_agr
    when '' then ''
    else 'X'
    end as Derived,
    case when left(agr_define.agr_name,4) = 'SAP_' then 'X'
    when left(agr_define.agr_name,1) = '/' then 'X'
    else ''
    end as SAP_supplied,
    case when imp.parent is null then '' else 'X' end as Imparting,
    _agr_1251.auth as auth,
    _agr_texts.text as description,
    concat(
    concat('/sap/bc/gui/sap/its/webgui?~transaction=*PFCG%20AGR_NAME_NEU=',agr_define.agr_name),
    ';DYNP_OKCODE=ANZE') as webgui
    
}
