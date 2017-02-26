FROM ubuntu

RUN apt-get -y update

RUN apt-get -y install rtmpdump swftools libxml2-utils libav-tools wget git at

WORKDIR /home/radiko

### http://tech.matchy.net/archives/152#comment-14219 より
RUN git clone https://gist.github.com/3956266.git

RUN mv 3956266/rec_radiko.sh  /usr/local/bin/
RUN chmod +x /usr/local/bin/rec_radiko.sh

