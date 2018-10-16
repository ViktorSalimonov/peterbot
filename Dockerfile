FROM python:3.6.6

MAINTAINER Viktor Salimonov <viktor.salimonov@outlook.com>


ADD peterbot /peterbot
COPY requirements.txt /requirements.txt
ADD cmdline.sh /
ADD debug-bot.sh /
ADD local-server.sh /
ADD server.sh /
ADD test-server.sh /

RUN  set -x && \
    pip install -r requirements.txt && \
    pip install rasa_core && \
    pip install rasa_nlu[tensorflow] && \
    python -m spacy download en && \

#ENTRYPOINT ["sh", "/run.sh"]
