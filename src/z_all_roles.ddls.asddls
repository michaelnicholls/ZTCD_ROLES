

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'all roles'
@Metadata.ignorePropagatedAnnotations: true
define view entity  z_all_roles as select from agr_agrs
{
    agr_name,
    child_agr,
    'X'  as composite,
    ' (Composite)' as roletype
}
union 
select from agr_define 
{  agr_name, 
agr_name as child_agr,
''  as composite,
' (Single)' as roletype
}
