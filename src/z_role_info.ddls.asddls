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
//inner join z_all_roles on z_all_roles.child_agr = agr_define.agr_name
left outer join z_imparting_roles as imp on imp.parent = agr_define.agr_name
left outer join Z_composite_ROLES as comp on comp.child_agr = agr_define.agr_name
//association to agr_1251 as _agr_1251 on $projection.agr_name = _agr_1251.agr_name
inner join  z_all_auths  on agr_define.agr_name = z_all_auths.agr_name

association to agr_texts as _agr_texts on $projection.agr_name = _agr_texts.agr_name
    and _agr_texts.spras = $session.system_language
    and _agr_texts.line = '00000'

{
  //  agr_define.agr_name as x,
    z_all_auths.agr_name, 
    agr_define.parent_agr,
    cast (case agr_define.parent_agr
    when '' then ''
    else 'X'
    end as z_derived_flag) as Derived,
    cast (case when left(agr_define.agr_name,4) = 'SAP_' then 'X'
    when left(agr_define.agr_name,1) = '/' then 'X'
    else ''
    end as z_sap_flag) as SAP_supplied,
    cast (case when imp.parent is null then '' else 'X' end as z_imparting_flag) as Imparting,
    cast (case when comp.child_agr is null then '' else 'X' end as z_in_composite_flag) as in_composite,
    z_all_auths.auth,
    _agr_texts.text as description,
    cast(z_all_auths.composite as z_is_composite_flag) as composite,
    concat(
    concat('/sap/bc/gui/sap/its/webgui?~transaction=*PFCG%20AGR_NAME_NEU=',agr_define.agr_name),
    ';DYNP_OKCODE=ANZE') as webgui
    
}
