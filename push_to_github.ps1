# QuizMaster-APK Push Script
# Usage: .\push_to_github.ps1 in PowerShell

$ErrorActionPreference = "Stop"

$USERNAME = "1nbuhuiwan"
$REPO = "QuizMaster-APK"
$BRANCH = "main"

Write-Host "=== QuizMaster-APK Auto Push Script ===" -ForegroundColor Cyan
Write-Host ""

# 1. Check Git status
Write-Host "[1/5] Checking Git status..." -ForegroundColor Yellow
git status

# 2. Add all files
Write-Host "`n[2/5] Adding files to Git..." -ForegroundColor Yellow
git add .
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Cannot add files" -ForegroundColor Red
    exit 1
}

# 3. Commit (if there are changes)
$status = git status --porcelain
if ($status) {
    Write-Host "`n[3/5] Committing changes..." -ForegroundColor Yellow
    git commit -m "Update: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
} else {
    Write-Host "`n[3/5] No changes, skipping commit" -ForegroundColor Gray
}

# 4. Push (auto create main branch)
Write-Host "`n[4/5] Pushing to GitHub..." -ForegroundColor Yellow

# Check current branch
$currentBranch = git branch --show-current

if ($currentBranch -ne $BRANCH) {
    Write-Host "Current branch: $currentBranch, switching to $BRANCH..." -ForegroundColor Yellow
    git branch -M $BRANCH
}

# Push
git push -u origin $BRANCH 2>&1 | Tee-Object -Variable pushOutput

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n✓ Push successful!" -ForegroundColor Green
} else {
    Write-Host "`n✗ Push failed. Check if repo exists:" -ForegroundColor Red
    Write-Host "https://github.com/new (create repo: $REPO)" -ForegroundColor Yellow
    exit 1
}

# 5. Open GitHub Actions page
Write-Host "`n[5/5] Opening GitHub Actions..." -ForegroundColor Yellow
$actionsUrl = "https://github.com/$USERNAME/$REPO/actions"
Write-Host "Check build progress in browser:" -ForegroundColor Cyan
Write-Host $actionsUrl -ForegroundColor Blue

# Auto open browser
Start-Process $actionsUrl

Write-Host "`n=== Done ===" -ForegroundColor Green
Write-Host "After build completes, download APK from Actions > Artifacts" -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to exit"
