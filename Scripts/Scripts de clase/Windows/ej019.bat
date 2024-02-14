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

set dinero2=200 100 50 20 10 5 2 1
set dinero=%1
echo Se ha comprado un artículo de %dinero% euros y ha pagado 500 euros.
set /a cambio=500 - dinero

if %cambio% equ 0 (
    echo No hay que entregar cambio
) else (
    for %%i in (%dinero2%) do (
        if %cambio% geq %%i (
            set /a "resultado=cambio/%%i"
            echo !resultado! billete(s) de %%i euro(s)
            set /a "cambio=cambio-resultado*%%i"
        )
    )
)