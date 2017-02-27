radiko memo
---

matchyさんの https://gist.github.com/3956266.git をDocker で動かす

Dockerをインストールする
====

    https://docs.docker.com/docker-for-mac/  とか
    DockerToolとかとか で
    
Dockerfile
====

    FROM ubuntu
    RUN apt-get -y update

    RUN apt-get -y install rtmpdump swftools libxml2-utils libav-tools wget git

    WORKDIR /home/radiko

    ### http://tech.matchy.net/archives/152#comment-14219 より
    RUN git clone https://gist.github.com/3956266.git

    RUN mv 3956266/rec_radiko.sh  /usr/local/bin/
    RUN chmod +x /usr/local/bin/rec_radiko.sh

build する
====
作業ディレクトリを適当に作ってその中に、上のDockerfileを置いてから、そのディレクトリ内で実行

    docker build -t myradiko .

確認

    docker images
    
    REPOSITORY          TAG 
    myradiko            latest  
    
  とかが見えればできてる
  
実行する
====

TBSラジオを2分間録音する 結果は/tmp/mp3ディレクトリにできる

    docker run -it --rm -v /tmp/mp3:/home/radiko myradiko /usr/local/bin/rec_radiko.sh TBS 2
    
atコマンドで時刻指定して録音する(未確認)
=====
0時59分から TBSラジオを122分間録音する (UnixLike OS)

    echo "docker run -it --rm -v /tmp/mp3:/home/radiko myradiko /usr/local/bin/rec_radiko.sh TBS 122" | at 0059
    
最近のMacOSだと　/System/Library/LaunchDaemons/com.apple.atrun.plist のDisableをEnableに編集して　

    sudo launchctl unload -F /System/Library/LaunchDaemons/com.apple.atrun.plist
    sudo launchctl load -F /System/Library/LaunchDaemons/com.apple.atrun.plist

するのにリカバリモードで起動して csrutil disable　しないと書き換えられないようだ

確認
 
 　　atq
   
追加

らじるらじるだと　http://engineermemo.seesaa.net/article/433698303.html　のスクリプトでバッチリ
