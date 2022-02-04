@ECHO OFF
REM Based on 
REM Mass Zip, RAR to 7Zip Recompression Batch File by Andrew Armstrong
REM http://aarmstrong.org/tutorials/mass-zip-rar-to-7zip-recompression-batch-file
REM
REM Find all .cbr and .rar files in the current directory, recompress them into .cbz and .zip files - but do not delete the originals.

ECHO Searching for CBR and RAR files to recompress into CBZ (Comic Book Zip) archives.

for %%F in (*.cbr *.rar) do (
ECHO Found %%F to recompress...
REM Extract...
"C:\Program Files\7-zip\7z" x "%%F" -o"%%F contents"
REM Does the directory exist? has 7zip created it correctly?
IF EXIST "%%F contents" (
REM Change directory, create zip of contents of directory...
CD "%%F contents"
REM remove banners 
DEL /F /S /Q
REM Delete Thumbnail files. 
DEL /F /S /Q Thumbs.db
REM compression level is 0, store only. 
"C:\Program Files\7-zip\7z" a -tzip "../%%~nF.cbz" * -mx=0
CD ..
REM Delete the temporary extraction folder
RMDIR "%%F contents" /S /Q
ECHO Recompressed %%F to %%~nF.zip
)
)
ECHO Search ended.

PAUSE
CLS
EXIT