$ErrorActionPreference = "Stop"

$userSitePackages = Join-Path $env:APPDATA "Python\Python314\site-packages"

if (Test-Path $userSitePackages) {
    if ([string]::IsNullOrWhiteSpace($env:PYTHONPATH)) {
        $env:PYTHONPATH = $userSitePackages
    } elseif ($env:PYTHONPATH -notlike "*$userSitePackages*") {
        $env:PYTHONPATH = "$userSitePackages;$env:PYTHONPATH"
    }
}

Write-Host ""
Write-Host "Digital HUB PC запускается..." -ForegroundColor Cyan
Write-Host "После старта открой: http://127.0.0.1:8000/" -ForegroundColor Green
Write-Host "Admin: admin / 1234" -ForegroundColor Yellow
Write-Host ""

python -m uvicorn app.main:app --host 127.0.0.1 --port 8000
