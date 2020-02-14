#pull official base image
FROM python:3.6.4-alpine

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

#create directory
RUN mkdir -p /home/app

# create the app user
RUN addgroup -S app && adduser -S app -G app

# create the appropriate directories
ENV HOME=/home/app
ENV APP_HOME=/home/app/web
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# install dependencies
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
COPY requirements.txt $APP_HOME
RUN pip install -r /$APP_HOME/requirements.txt

# copy entrypoint.sh
COPY entrypoint.sh $APP_HOME

# copy project
COPY . $APP_HOME

# chown all the files to the app user
RUN chown -R app:app $APP_HOME

# change to the app user
USER app

# run entrypoint.sh
ENTRYPOINT ["/bin/sh", "/home/app/web/entrypoint.sh"]
