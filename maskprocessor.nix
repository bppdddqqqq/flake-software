{ lib, stdenv} :
stdenv.mkDerivation {
  pname   = "maskprocessor";
  version = "0.7.3";

  src = fetchGit {
    url = "https://github.com/hashcat/maskprocessor.git";
    rev = "9c33ab2428ac155bf9c8e604a1b29bd3dbed5a52";
  };

  sourceRoot = "source/src";

  installPhase = ''
    runHook preInstall
    install -Dm0555 *.bin -t $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "Fast password generator";
    homepage    = "https://hashcat.net/hashcat/";
    license     = licenses.mit;
    platforms   = platforms.linux;
    maintainers = with maintainers; [ kierdavis zimbatm ];
  };
}

