

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'imparting roles'
@Metadata.ignorePropagatedAnnotations: true
define view entity z_imparting_roles as select from agr_define
{
    
    parent_agr as parent
} where parent_agr <> ''
