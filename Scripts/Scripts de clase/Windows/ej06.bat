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

set seg=%1
set /a dias=seg / 86400
set /a horas=(seg %% 86400) / 3600
set /a minutos=((seg %% 86400) %% 3600) / 60
set /a segundos=((seg %% 86400) %% 3600) %% 60
echo %seg% segundos son %dias% dias, %horas% horas, %minutos% minutos y %segundos% segundos.
