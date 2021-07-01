cd ../../maps/frontier

FOR /R %%f IN (*.dmm) DO (
  copy "%%f" "%%f.backup"
)

pause
