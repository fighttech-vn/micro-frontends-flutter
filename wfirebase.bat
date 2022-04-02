REM Create by TrungHieuTran
@echo OFF
cls

flutter build web --web-renderer=html

@REM call Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
firebase deploy