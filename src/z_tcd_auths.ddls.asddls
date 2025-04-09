@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TCD auths'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_TCD_AUTHS as select from agr_1251 inner join z_all_roles on agr_1251.agr_name = z_all_roles.child_agr


{
 //   agr_1251.auth,
    
 //   agr_1251.field,
    cast(agr_1251.low as tcode) as tcode,
    z_all_roles.agr_name,
    z_all_roles.child_agr,
    z_all_roles.composite,
    z_all_roles.roletype
    
} where agr_1251.object = 'S_TCODE'
