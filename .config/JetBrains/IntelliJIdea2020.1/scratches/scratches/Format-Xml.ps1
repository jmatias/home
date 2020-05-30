function Format-Xml {
    Param(
        [Parameter(Mandatory = $true)]
        [xml]$xmlDoc
    )
    $sb = New-Object System.Text.StringBuilder
    $sw = New-Object System.IO.StringWriter($sb)
    $wr = New-Object System.Xml.XmlTextWriter($sw)
    $wr.Formatting = [System.Xml.Formatting]::Indented
    $xmlDoc.Save($wr)
    return $sb.ToString()
}
