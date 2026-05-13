# Quick fix push script
$ErrorActionPreference = "Stop"

Write-Host "=== Pushing fix to GitHub ===" -ForegroundColor Cyan
Write-Host ""

# Add and commit
Write-Host "[1/3] Adding updated build.yml..." -ForegroundColor Yellow
git add .github/workflows/build.yml

Write-Host "`n[2/3] Committing fix..." -ForegroundColor Yellow
git commit -m "Fix: Use gradle action instead of gradlew"

Write-Host "`n[3/3] Pushing to GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host "`n✓ Fix pushed!" -ForegroundColor Green
Write-Host "GitHub Actions will rebuild automatically." -ForegroundColor Cyan
Write-Host "Check progress at: https://github.com/1nbuhuiwan/QuizMaster-APK/actions" -ForegroundColor Blue
Write-Host ""
Read-Host "Press Enter to open Actions page"
Start-Process "https://github.com/1nbuhuiwan/QuizMaster-APK/actions"
