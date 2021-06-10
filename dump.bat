@echo off
rem check if the pdmp file exists
if exist emacs.pdmp (
    goto clean 
) else (
    goto dump
)

:clean
echo remove the old pdmp file
del emacs.pdmp
goto dump

:dump
echo dump the emacs

set D_HOME=%cd%
cd  ../emacs*/bin
set E_HOME=%cd%

%E_HOME%\emacs.exe --batch -l %D_HOME%\dump.el
