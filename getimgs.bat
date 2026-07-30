@echo off
setlocal enabledelayedexpansion

set "OUTPUT_FILE=gallery.json"
set "IMG_DIR=Images"

echo [ > %OUTPUT_FILE%

set "first=1"

for %%F in (%IMG_DIR%\*.jpg %IMG_DIR%\*.jpeg %IMG_DIR%\*.png %IMG_DIR%\*.webp) do (
    if "!first!"=="0" echo , >> %OUTPUT_FILE%
    set "first=0"
    
    set "filename=%%~nxF"
    set "basename=%%~nF"
    
    echo   { >> %OUTPUT_FILE%
    echo     "src": "%IMG_DIR%/!filename!", >> %OUTPUT_FILE%
    echo     "caption": "!basename!" >> %OUTPUT_FILE%
    echo   } >> %OUTPUT_FILE%
)

echo ] >> %OUTPUT_FILE%

echo Updated %OUTPUT_FILE% with images from %IMG_DIR%!
pause