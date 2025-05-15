@echo off
chcp 65001 > nul
title Muzik Modu Ayarlari
color 0A

REM Degerler dakika cinsindendir
set NORMAL_SURE=10
set MUZIK_SURE=1
set ACIK_SURE=9999

:MENU
cls
echo ==============================
echo     ScreenTimeSwitch
echo ==============================
echo [1] Muzik Modu (Ekran 1 dakikada kapanir)
echo [2] Normal Moda Don (Ekran 10 dakikada kapanir)
echo [3] Ekran Acik Modu (Ekran hicbir zaman kapanmaz)
echo [4] Cikis
echo ==============================
set /p secim=Lutfen bir secim yapin (1/2/3/4): 

if "%secim%"=="1" (
    powercfg /change monitor-timeout-ac %MUZIK_SURE%
    powercfg /change monitor-timeout-dc %MUZIK_SURE%
    echo Muzik modu etkinlestirildi. Ekran 1 dakikada kapanacak.
    timeout /t 2 > nul
    goto MENU
)

if "%secim%"=="2" (
    powercfg /change monitor-timeout-ac %NORMAL_SURE%
    powercfg /change monitor-timeout-dc %NORMAL_SURE%
    echo Normal moda donuldu. Ekran 10 dakikada kapanacak.
    timeout /t 2 > nul
    goto MENU
)

if "%secim%"=="3" (
    powercfg /change monitor-timeout-ac %ACIK_SURE%
    powercfg /change monitor-timeout-dc %ACIK_SURE%
    echo Ekran Acik Modu etkin. Ekran kapanmayacak.
    timeout /t 2 > nul
    goto MENU
)

if "%secim%"=="4" (
    echo Programdan cikiliyor...
    timeout /t 1 > nul
    exit
)

echo Gecersiz secim! Lutfen tekrar deneyin.
timeout /t 2 > nul
goto MENU
