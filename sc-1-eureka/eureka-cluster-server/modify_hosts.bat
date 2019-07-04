%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

attrib -R C:\WINDOWS\system32\drivers\etc\hosts 
@echo 127.0.0.1 peer1 >> C:\WINDOWS\system32\drivers\etc\hosts
@echo 127.0.0.1 peer2 >> C:\WINDOWS\system32\drivers\etc\hosts
@echo 127.0.0.1 peer3 >> C:\WINDOWS\system32\drivers\etc\hosts

ipconfig /flushdns
