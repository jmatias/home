Param(
    [string]$folder1,
    [string]$folder2
)

$folder1 = Resolve-Path $folder1
$folder2 = Resolve-Path $folder2

"Comparing [$folder1] with [$folder2]"

$ignoredRegex = "unittests|Samples|web\\scripts|update.mobile.theme|styles"

$firstFolder = Get-ChildItem $folder1 -File -Recurse
$secondFolder = Get-ChildItem $folder2 -File -Recurse

$firstFolder | ForEach-Object {

    $file1 = $_
    $file2 = $_.FullName.Replace($folder1, $folder2)
    "[$( $file1.FullName )] <-> [$file2]" | Write-Verbose


    # Check if the file, from $folder1, exists with the same path under $folder2
    If (Test-Path ( $file2))
    {
        $file2 = Get-Item $file2
        if ($file1.Extension -match ("exe|dll"))
        {
            return
        }
        $file2 = Get-Item $file2

        # Compare the contents of the two files...
        If (($file1.Length -eq 0) -or ($file2.Length -eq 0))
        {
            $different = $true
        }

        If (-not $different)
        {
            if (Compare-Object -PassThru (Get-Content $file1.FullName) (Get-Content $file2.FullName))
            {
                "$( $file1.FullName ) <-> $( $file2.FullName )"
                Compare-Object (Get-Content $file1.FullName) (Get-Content $file2.FullName)
                $different = $true
            }
        }


        if ($different)
        {

#            Write-Verbose "$( $file1.FullName ) <-> $( $file2.FullName )"
#            "code $( $file1.FullName ) $file2"
        }
    }
    else
    {
        $file2 = $_.FullName.Replace($folder1, $folder2)
        Write-Output "$($_.FullName.Replace("\\", "\\\\") ) does not exist in $( $file2 )"
    }
}

"****************************************************"
"****************************************************"

$secondFolder | ForEach-Object {

    # Check if the file, from $folder1, exists with the same path under $folder2
    If (-not(Test-Path ( $_.FullName.Replace($folder2, $folder1))))
    {
        $file1 = $_.FullName.Replace($folder2, $folder1)
        Write-Output "$( $_.FullName ) does not exist in $( $file1 )"
    }
}

"`n`nDone..."
