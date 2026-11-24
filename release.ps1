# The addon folder is the subfolder holding a .toc with the same name. It differs
# from the repository folder name, because CurseForge installs it under that name.
$srcDir = Get-ChildItem $PSScriptRoot -Directory |
    Where-Object { Test-Path (Join-Path $_.FullName "$($_.Name).toc") } |
    Select-Object -First 1

if (-not $srcDir) {
    Write-Error "No addon folder (a subfolder containing <folder name>.toc) found in $PSScriptRoot"
    exit 1
}

$addonName = $srcDir.Name
$tocFile = Join-Path $srcDir.FullName "$addonName.toc"
$tocContent = Get-Content $tocFile -Raw

if ($tocContent -match '## Version:\s*(.+)') {
    $version = $Matches[1].Trim()
} else {
    Write-Error "Could not parse version from $addonName.toc"
    exit 1
}

# Development-only files that stay out of the release zip.
$devOnlyFiles = @('Debug.lua')

$releaseDir = Join-Path $PSScriptRoot 'release'
New-Item -ItemType Directory -Force $releaseDir | Out-Null

$zipName = "${addonName}_$version.zip"
$zipPath = Join-Path $releaseDir $zipName
$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) "${addonName}_release_$(Get-Random)"
$stageDir = Join-Path $tempDir $addonName

try {
    Copy-Item $srcDir.FullName $stageDir -Recurse

    foreach ($file in $devOnlyFiles) {
        $stagedFile = Join-Path $stageDir $file
        if (Test-Path $stagedFile) {
            Remove-Item $stagedFile
        }
    }

    if (Test-Path $zipPath) {
        Remove-Item $zipPath
    }

    Compress-Archive -Path $stageDir -DestinationPath $zipPath
    Write-Host "Created release/$zipName (v$version)"
} finally {
    if (Test-Path $tempDir) {
        Remove-Item $tempDir -Recurse -Force
    }
}
