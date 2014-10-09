rem batch script to run setup.py with approprate options
set version=sss2rdf-0.1

rem create initial distribution

rmdir .\%version% /s/q
rmdir .\build /s/q
c:\python27\python setup.py py2exe --dist-dir=%version% --packages encodings
rmdir .\build /s/q
rmdir .\output /s/q
mkdir .\output
copy readme.html .\output\*
move /y .\sss2rdf-0.1\sss2rdf.exe .\output\sss2rdf.exe
rmdir .\sss2rdf-0.1 /s/q
