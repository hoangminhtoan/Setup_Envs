echo "Install wine on ubuntu 18.04 bionic"

sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
sudo add-apt-repository ppa:cybermax-dexter/sdl2-backport
sudo apt update && sudo apt install --install-recommends winehq-stable
sudo apt-get install cabextract
sudo apt install winetricks
which wine 


WINEARCH=win32 winecfg


#cd ~/.wine/drive_c/windows/Fonts
#wget wget <https://cdn.rawgit.com/madrascheck/gtalk/293bc389/app/resource/web/fonts/MalgunGothic.ttf>
#맑은고딕 설치

#wine글꼴 수정
#sudo vi ~/.wine/system.reg

#...
#"MS Shell Dlg"="Tahoma" #를 지우고
#"MS Shell Dlg"="Malgun Gothic" #로 변경
#"MS Shell Dlg 2"="Tahoma"
#...

#sudo vi ~/.local/share/applications/wine/Programs/KakaoTalk/KakaoTalk.desktop


#...
#Exec=env WINEPREFIX="/home/ubuntu/.wine"
#LANG="ko_KR.UTF-8" #추가부분

