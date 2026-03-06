{
  lib,
  buildPythonPackage,
  fetchPypi,
  uv-build,
  click,
  coverage,
  libcst,
  pytest,
  setproctitle,
  textual,
}:

buildPythonPackage rec {
  pname = "mutmut";
  version = "3.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-VIGG1LDElLe5iV24KHHLHyKbknHJ/3zWM+NI3Zr8x3I=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "uv_build>=0.9.5,<0.10.0" "uv_build>=0.9.5"
  '';

  build-system = [ uv-build ];

  dependencies = [
    click
    coverage
    libcst
    pytest
    setproctitle
    textual
  ];

  pythonImportsCheck = [ "mutmut" ];

  meta = {
    description = "Mutation testing for Python";
    homepage = "https://github.com/boxed/mutmut";
    license = lib.licenses.bsd3;
  };
}
