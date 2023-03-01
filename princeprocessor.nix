{ lib, stdenv} :
stdenv.mkDerivation {
  pname   = "princeprocessor";
  version = "0.2.2";

  src = fetchGit {
    url = "https://github.com/hashcat/princeprocessor.git";
    rev = "e4e7d891fb3977dbfc69e7f74c1ff5b874defbf9";
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

