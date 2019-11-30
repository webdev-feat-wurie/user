FROM python:3-alpine
ENV PYTHONUNBUFFERED 1
RUN apk add --no-cache --virtual .pynacl_deps build-base python3-dev libffi-dev musl-dev
RUN apk update && apk add postgresql-dev gcc
RUN mkdir /code
WORKDIR /code
COPY Pipfile /code/
COPY Pipfile.lock /code/
RUN pip install pipenv
RUN pipenv install --system
COPY . /code/
COPY start.sh /code/
CMD ["sh", "/code/start.sh"]