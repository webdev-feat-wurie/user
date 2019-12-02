FROM python:3-alpine
ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code
COPY . /code/

RUN apk update && apk add postgresql-dev gcc
RUN apk add --no-cache --virtual .pynacl_deps build-base python3-dev libffi-dev musl-dev && pip install -r requirements.txt && apk del .pynacl_deps

CMD ["sh", "/code/start.sh"]