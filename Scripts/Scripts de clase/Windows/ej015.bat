@echo off
REM ***************************
REM * NOMBRE: 	ej06.bat
REM * AUTOR: Joseph Vanegas Caicedo <josephvanegas48@gmail.com>
REM *
REM * OBJETIVO: calcular el tiempo
REM *
REM * VERSIÓN: 2024-02-14 
REM *
REM ***************************
@echo off
set base=%1
set altura=%2

if "%altura%"=="" (
    if "%base%"=="" (
        set base=7
        set altura=4
    ) else (
        set altura=4
    )
)

set resultado=##
for /l %%i in (2,1,%base%) do (
    set "resultado+=" #"
)

for /l %%i in (1,1,%altura%) do (
    echo %resultado%
)