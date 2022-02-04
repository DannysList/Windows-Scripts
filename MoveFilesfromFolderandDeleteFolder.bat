@ECHO OFF
SETLOCAL
SET parent="E:\--incoming\sorting"
CD /d %parent% 
FOR /r %parent% %%d IN (*.*) DO MOVE "%%d" %parent% 
FOR /f "delims=" %%d IN ('DIR /a:d /s /b ^| SORT /r') DO RD "%%d"
ECHO Done. Press any key to terminate script.
PAUSE >NUL