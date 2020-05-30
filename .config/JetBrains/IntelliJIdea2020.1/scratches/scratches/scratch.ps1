function Compare-Dirs {

    Param(
        [string]$folder1,
        [string]$folder2
    )

    $ignoredRegex = "unittests|Samples|web\\scripts|update.mobile.theme|styles"

    $firstFolder = Get-ChildItem -Recurse $folder1 -File | ?{-not (@( ".js", ".cs", ".gz", ".log.gz", ".css", ".gif", ".png", ".less",".pdb") -contains $_.Extension)} |
            ?{ -not ( $_.FullName -match $ignoredRegex ) }

    $secondFolder = Get-ChildItem -Recurse $folder2 -File | ?{-not (@( ".js", ".cs", ".gz", ".log.gz", ".css", ".gif", ".png",".less",".pdb") -contains $_.Extension)} |
            ?{ -not ( $_.FullName -match $ignoredRegex ) }


    $firstFolder | ForEach-Object {

        $file2 = $_.FullName.Replace($folder1, $folder2)

        # Check if the file, from $folder1, exists with the same path under $folder2
        If ( Test-Path ( $file2 ) ) {
            if($_.Extension -match("exe|dll"))
            {
                return
            }
            $file2 = Get-Item $file2

            # Compare the contents of the two files...
            If ( ($_.Length -eq 0) -or ($file2.Length -eq 0) ) {
                $different = $true
            }

            If ( -not $different) {
                if(Compare-Object -PassThru(Get-Content $_.FullName) (Get-Content $file2 )) {
                    $different = $true
                }
            }


            if($different) {
                Write-Host "$($_.FullName) <-> $($file2.FullName)" -BackgroundColor Yellow -ForegroundColor Black
                "code $($_.FullName) $file2"
            }
        }
        else {
            $file2 = $_.FullName.Replace($folder1, $folder2)
            Write-Host "$($_.FullName.Replace("\\","\\\\")) does not exist in $($file2.FullName)" -BackgroundColor red
        }
    }

    $secondFolder | ForEach-Object {

        # Check if the file, from $folder1, exists with the same path under $folder2
        If ( -not(Test-Path ( $_.FullName.Replace($folder2, $folder1) ) )) {
            $file1 = $_.FullName.Replace($folder2, $folder1)
            Write-Host "$($_.FullName) does not exist in $($file1)" -BackgroundColor red
        }
    }
}