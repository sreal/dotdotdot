@ECHO OFF
node "%APPDATA%"\npm\node_modules\jslint\bin\jslint.js >"%TEMP%"\jslint.out 2>&1 %*
TYPE "%TEMP%"\jslint.out