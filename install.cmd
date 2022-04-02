@echo OFF
mkdir vnc-install
echo Installing dependencies...
echo  Python
curl --location --progress-bar "https://github.com/hello-smile6/NoVNC-windows/releases/download/python/py.msix" --output vnc-install/py.msix
powershell Add-AppxPackage vnc-install/py.msix
echo  Git Bash (To run NoVNC)
curl --location --progress-bar "https://github.com/hello-smile6/NoVNC-windows/releases/download/python/git-bash.tgz" --output -|tar -xf - -C vnc-install
echo  NoVNC
rem vnc-install\git-bash\usr\bin\rm.exe -rf vnc-install/novnc
rem vnc-install\git-bash\cmd\git.exe clone --single-branch --depth 1 --no-tags https://github.com/novnc/novnc.git vnc-install/novnc
curl --location --progress-bar "https://github.com/novnc/noVNC/archive/refs/tags/v1.3.0.tar.gz" --output -|tar -xf - -C vnc-install
echo  TightVNC
curl --location --progress-bar "https://github.com/hello-smile6/NoVNC-windows/releases/download/python/tightvnc.tgz" --output -|tar -xf - -C vnc-install
rem vnc-install\git-bash\bin\bash
echo Starting TightVNC
rem start vnc-install\git-bash\bin\bash.exe vnc-install\NoVNC-1.3.0\utils\novnc_proxy
set OLDCD=%CD%
start vnc-install\TightVNCServerPortable\TightVNCServerPortable.exe
echo Starting NoVNC
cd vnc-install\NoVNC-1.3.0\utils\
start ..\..\git-bash\bin\bash.exe ./novnc_proxy
cd %OLDCD%
