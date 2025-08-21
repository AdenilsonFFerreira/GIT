@echo off

:: xcopy "C:\wamp64\www" "C:\GIT\PHP" /E /H /C /I /Y
:: echo Pasta copiada com sucesso!

:: Mude para o diretório que você deseja entrar
cd "C:"
cd "C:\GIT"

:: Execute o programa no outro diretório
start "" "C:\Program Files\Git\bin\bash.exe"
