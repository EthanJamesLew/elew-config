{ python37, python37Packages }:
let
  my-python-packages = python37Packages : with python37Packages; [
    virtualenvwrapper 
    numpy
    pandas
    matplotlib
    pyqtgraph
    pyqt5
    pyopengl
    sphinx
  ];
in (python37.withPackages my-python-packages).override (args: { ignoreCollisions = true; })
