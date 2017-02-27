radiko memo
----


*Dockerfile

　　　　

*build する

    docker build -t myradiko .

*実行する (未確認)

TBSラジオを2分間録音する 結果は/tmp/mp3ディレクトリに

    docker run -it --rm -v /tmp/mp3:/home/radiko myradiko /usr/local/bin/rec_radiko.sh TBS 2
    
0時59分から TBSラジオを122分間録音する

    at 0059
    docker run -it --rm -v /tmp/mp3:/home/radiko myradiko /usr/local/bin/rec_radiko.sh TBS 122
   
 確認
 
 　　at -l
   
