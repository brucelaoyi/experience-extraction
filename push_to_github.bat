@echo off
chcp 65001 >nul
echo ==========================================
echo 推送 经验萃取师 AstraFlow Skill 到 GitHub
echo ==========================================
echo.
echo 仓库地址：https://github.com/brucelaoyi/experience-extraction
echo.
echo 注意：GitHub 已不支持账号密码登录，需要你输入 Personal Access Token。
echo 如果没有 Token，请先到 github.com 生成：
echo   Settings -^> Developer settings -^> Personal access tokens -^> Tokens (classic)
echo   勾选 "repo" 权限，生成后复制字符串当密码用。
echo.

set REPO_DIR=C:\00_Work\01培训课程\2026年\UCloud优刻得需求\经验萃取师_AstraFlow_Skill
set GIT="C:\Program Files\Git\cmd\git.exe"
set REPO_URL=https://github.com/brucelaoyi/experience-extraction.git

cd /d %REPO_DIR%

echo [1/4] 切换到 main 分支...
%GIT% branch -M main

echo [2/4] 添加远程仓库...
%GIT% remote remove origin 2>nul
%GIT% remote add origin %REPO_URL%

echo [3/4] 拉取 GitHub 上的 README（如果你创建时勾了 README）...
%GIT% pull origin main --rebase --allow-unrelated-histories

echo [4/4] 推送本地代码到 GitHub...
%GIT% push -u origin main

echo.
echo 如果弹出用户名/密码窗口：
echo   用户名：brucelaoyi
echo   密码：填你的 Personal Access Token（不是微信/QQ密码）
echo.
pause
