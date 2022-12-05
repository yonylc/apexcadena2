@echo off

start /wait MsiExec.exe /X {CE73BCF2-8C36-4CCD-9331-5CCD2F987706} /quiet /passive /norestart /qn
start /wait MsiExec.exe /X {7D256468-9487-4498-9C6F-F18E9DCEA212} /quiet /passive /norestart /qn
start /wait MsiExec.exe /X {CE2F0EC1-BF6B-42A6-993C-1D9655D0C9DF} /quiet /passive /norestart /qn


timeout /t 30 /nobreak


GOTO CHECKOS

:CHECKOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO INSTAPEX64BIT) ELSE (GOTO INSTAPEX32BIT)


:INSTAPEX64BIT
start /wait MsiExec.exe /I "C:\users\agent_cloud_x64.msi" /qn


:INSTAPEX32BIT
start /wait MsiExec.exe /I "C:\users\agent_cloud_x86.msi" /qn



GOTO END

:END
del /s /q /f "C:\users\agent_cloud_x64.msi"
del /s /q /f "C:\users\agent_cloud_x86.msi"
del "%~f0" & exit