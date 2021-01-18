::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCqDJNBfBcv9yp6Qq4BZ4VfiSLwf54g=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhSA==
::ZQ05rAF9IBncCkqN+0xwdVsFLA==
::ZQ05rAF9IAHYFVzEqQIUO0h2TQeJKXva
::eg0/rx1wNQPfEVWB+kM9LVsJDCCRb0m7Bb4J+Ig=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE2UM/SA==
::ZQ0/vhVqMQ3MEVWAtB9wBRpbLA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRmg5xESKRhfWRTi
::Zh4grVQjdCqDJNBfBcv9yp6Qq4BZ4VeeFeY+6evw+vrJp1UYNA==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
@chcp 65001
echo Created by Mao

choice  /c BRQ /m "输入B备份,R还原备份,Q关闭,默认10秒后关闭(不区分大小写)" /d Q /t 10

if %errorlevel%==1 (
    Goto backupFunction
) else if %errorlevel%==2 (
    Goto restoreFunction
) else (
    echo Exiting...
    exit
)

:backupFunction (
    set backupName=
    set /p backupName=请输入存档名:

    if "%backupName%"=="" (
        set backupName=%date:~0,4%%date:~5,2%%date:~8,2%
        echo 未指定文件名,取系统时�?    )

    set backupDir=%~dp0%backupName%

    echo 备份目录:%backupDir%

    mkdir %backupDir%

    set saveDir=C:\Users\%userName%\AppData\Roaming\DarkSoulsIII

    xcopy %saveDir% %backupDir% /E /H /F

    echo 按任意键关闭...
    pause>nul
    exit
)

:restoreFunction (
    echo 当前已建立的存档:
    dir /ad/b
    set restoreName=
    set /p restoreName=请输入要还原的存档名:

    if "%restoreName%"=="" (
        echo 未指定文件名,按任意键关闭...
        pause>nul
        exit
    )
    set saveDir=C:\Users\%userName%\AppData\Roaming\DarkSoulsIII
    set backupDir=%~dp0%restoreName%

    if not exist %backupDir% (
        echo 指定存档不存,请输入正确的存档
        echo 按任意键关闭...
        pause>nul
        exit
    )

    xcopy %backupDir% %saveDir% /E /H /F

    echo 按任意键关闭...
    pause>nul
    exit

)