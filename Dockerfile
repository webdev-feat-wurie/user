FROM python:3-alpine
ENV PYTHONUNBUFFERED 1

RUN apk add --no-cache --virtual .pynacl_deps build-base python3-dev libffi-dev musl-dev
RUN apk update && apk add postgresql-dev gcc
RUN mkdir /code

WORKDIR /code
COPY . /code/
RUN pip install -r requirements.txt

CMD ["sh", "/code/start.sh"]