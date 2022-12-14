from distutils.core import setup, Extension

module1 = Extension("pyberlin", sources=["pyberlinmodule.c"])

setup(
    name="pyberlin",
    version="0.0.1",
    description="HAPPY CHRISTMAS PY-BERLIN!",
    ext_modules=[module1],
)
