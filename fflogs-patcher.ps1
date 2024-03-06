$zipExecutable = "C:\Program Files\7-Zip\7z.exe"
$fflogsJs = "$($env:LOCALAPPDATA)\Programs\FF Logs Uploader\resources\"

& $zipExecutable x "$fflogsJs\app.asar" "js\app.js" -o"$fflogsJs"

$appjs = "$fflogsJs\js\app.js"
$content = Get-Content -Path $appjs

$content -replace "gh.showBottomRightAd&&!e\?.enabledFeatures.noAds", "false" -replace "showBottomRightAd=!0", "showBottomRightAd = false" -replace "showBottomRightAd=!1", "showBottomRightAd = false" | Set-Content -Path $appjs

& $zipExecutable a "$fflogsJs\app.asar" "js\app.js"

Start-Sleep -Milliseconds 2000
