
#STEP 1 (CREATE WEB APPLICATION IF NEEDED AND IISRESET)

New-SPWebApplication -Name 'Contoso Sites' -Port 19565 -ApplicationPool ContosoAppPool -ApplicationPoolAccount (Get-SPManagedAccount 'AD2012\SP_Farm') -AuthenticationProvider (New-SPAuthenticationProvider -UseWindowsIntegratedAuthentication)
IISRESET /noforce 


#STEP 2(CREATE HOST-BASED SITE COLLECTION)
New-SPSite 'http://portal.contoso.com' -HostHeaderWebApplication 'http://sp2013srv:19565/' -Name 'Portal' -Description 'Customer Root' -OwnerAlias 'AD2012.LOC\Administrator' -language 1033 -Template 'STS#0'



