###
radiko memo

####

*Dockerfile

*build する

    docker build -t myradiko .

*実行する

TBSラジオを2分間録音する 


    docker run -it --rm -v /tmp/mp3:/home/radiko myradiko /usr/local/bin/rec_radiko.sh TBS 2


