@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'all auths'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z_all_auths as select from agr_1251 inner join z_all_roles on agr_1251.agr_name = z_all_roles.child_agr

{
    agr_1251.auth,
    z_all_roles.agr_name,
    z_all_roles.composite,
    z_all_roles.roletype
    
}
