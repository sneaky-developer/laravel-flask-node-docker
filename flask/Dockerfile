FROM python:3.8

RUN apt-get update && apt-get install -y nginx nano
#RUN cp nginx/default.conf /etc/nginx/conf.d/default.conf
COPY nginx/default.conf /etc/nginx/sites-enabled/default

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .
EXPOSE 80
CMD ["sh", "-c", "python app.py & nginx -g 'daemon off;'"]
#CMD ["python", "app.py","0.0.0.0:5000"]
