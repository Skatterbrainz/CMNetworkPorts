---
external help file: cmnetworkports-help.xml
Module Name: cmnetworkports
online version:
schema: 2.0.0
---

# Test-CmSiteSystemPorts

## SYNOPSIS
Test if Required Ports are open

## SYNTAX

```
Test-CmSiteSystemPorts [-SiteCode] <String> [-PrimaryServer] <String> [<CommonParameters>]
```

## DESCRIPTION
Test if required ports per site system role are open from the local host

## EXAMPLES

### EXAMPLE 1
```
Test-CmSiteSystemPorts -SiteCode "P01" -PrimaryServer "cm01.contoso.local"
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
ConfigMgr Primary site server or SMS Provider FQDN

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
