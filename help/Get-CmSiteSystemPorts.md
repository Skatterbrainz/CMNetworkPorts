---
external help file: cmnetworkports-help.xml
Module Name: cmnetworkports
online version:
schema: 2.0.0
---

# Get-CmSiteSystemPorts

## SYNOPSIS
Get CM Site Systems, Roles and Associated Network Ports

## SYNTAX

```
Get-CmSiteSystemPorts [-SiteCode] <String> [-PrimaryServer] <String> [<CommonParameters>]
```

## DESCRIPTION
Get CM Site Systems, Roles and Associated Network Ports

## EXAMPLES

### EXAMPLE 1
```
Get-CmSiteSystemPorts -SiteCode "P01" -PrimaryServer "cm01.contoso.local"
```

## PARAMETERS

### -SiteCode
3-character ConfigMgr Site Code

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrimaryServer
ConfigMgr Primary Site Server or SMS Provider FQDN

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
