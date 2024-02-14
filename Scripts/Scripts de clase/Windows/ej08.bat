@echo off
REM ***************************
REM * NOMBRE: 	ej08.bat
REM * AUTOR: Joseph Vanegas Caicedo <josephvanegas48@gmail.com>
REM *
REM * OBJETIVO: Calcular el IMC
REM *
REM * VERSIÓN: 2024-02-14 
REM *
REM ***************************

@echo off
set /p peso=Indique su peso en Kg: 
set /p altura=Indique su altura en Centimetros: 

set /a IMC=10000*peso/(altura*altura)

if %IMC% lss 16 (
    echo Delgadez severa
) else if %IMC% lss 17 (
    echo Delgadez moderada
) else if %IMC% lss 18.5 (
    echo Delgadez leve
) else if %IMC% lss 25 (
    echo Normal
) else if %IMC% lss 30 (
    echo Preobesidad
) else if %IMC% lss 35 (
    echo Obesidad leve
) else if %IMC% lss 40 (
    echo Obesidad media
) else (
    echo Obesidad morbida
)