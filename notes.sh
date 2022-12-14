# The Easy Way
pip install -vvv .
pip uninstall .

# The Hard Way
which python
ls -la $(which python)
cat $(which python)
hexdump $(which python)
file $(which python)
otool -h $(which python)
otool -tv $(which python) | grep Py_BuildValue
otool -p _Py_BuildValue -tv $(pyenv which python) > temp.txt

file build/temp.macosx-12.6-x86_64-cpython-310/pyberlinmodule.o
otool -tv build/temp.macosx-12.6-x86_64-cpython-310/pyberlinmodule.o

file build/lib.macosx-12.6-x86_64-cpython-310/pyberlin.cpython-310-darwin.so
otool -tv build/lib.macosx-12.6-x86_64-cpython-310/pyberlin.cpython-310-darwin.so

python
python -m sysconfig
python -m sysconfig > config.txt
python -c "import sysconfig; print(sysconfig.get_config_var('CC'))"
python -c "import sysconfig; print(sysconfig.get_config_var('PY_CFLAGS'))"
python -c "import sysconfig; print(sysconfig.get_config_var('INCLUDEPY'))"

$(python -c "import sysconfig; print(sysconfig.get_config_var('CC'))") $(python -c "import sysconfig; print(sysconfig.get_config_var('PY_CFLAGS'))") -I$(python -c "import sysconfig; print(sysconfig.get_config_var('INCLUDEPY'))") -c pyberlinmodule.c

file pyberlinmodule.o
otool -tv pyberlinmodule.o

python -c "import sysconfig; print(sysconfig.get_config_var('BLDSHARED'))"
python -c "import sysconfig; print(sysconfig.get_config_var('EXT_SUFFIX'))"

$(python -c "import sysconfig; print(sysconfig.get_config_var('BLDSHARED'))") pyberlinmodule.o -o pyberlin$(python -c "import sysconfig; print(sysconfig.get_config_var('EXT_SUFFIX'))")

python -c "import sysconfig; print(sysconfig.get_path('platlib'))"

cp pyberlin.cpython-310-darwin.so $(python -c "import sysconfig; print(sysconfig.get_path('platlib'))")
