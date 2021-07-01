cd ../../maps/utopia

FOR /R %%f IN (*.dmm) DO (
  copy "%%f" "%%f.backup"
)

pause
