

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'composite roles'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_composite_ROLES as select from agr_agrs
{
    agr_name,
    child_agr
    
} 
