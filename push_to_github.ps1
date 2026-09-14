# 推送 经验萃取师 AstraFlow Skill 到 GitHub
# 如果还没 Personal Access Token，先去 github.com 生成：
#   Settings -> Developer settings -> Personal access tokens -> Tokens (classic)
#   勾选 "repo" 权限

$RepoDir = "C:\00_Work\01培训课程\2026年\UCloud优刻得需求\经验萃取师_AstraFlow_Skill"
$Git = "C:\Program Files\Git\cmd\git.exe"
$RepoUrl = "https://github.com/brucelaoyi/experience-extraction.git"

Set-Location $RepoDir

Write-Host "[1/4] 切换到 main 分支..." -ForegroundColor Cyan
& $Git branch -M main

Write-Host "[2/4] 添加远程仓库..." -ForegroundColor Cyan
& $Git remote remove origin 2>$null
& $Git remote add origin $RepoUrl

Write-Host "[3/4] 拉取 GitHub 上的 README（如果你创建时勾了 README）..." -ForegroundColor Cyan
& $Git pull origin main --rebase --allow-unrelated-histories

Write-Host "[4/4] 推送本地代码到 GitHub..." -ForegroundColor Cyan
& $Git push -u origin main

Write-Host "`n如果要求输入凭据：" -ForegroundColor Yellow
Write-Host "  用户名：brucelaoyi"
Write-Host "  密码：  填你的 Personal Access Token（不是登录密码）"
