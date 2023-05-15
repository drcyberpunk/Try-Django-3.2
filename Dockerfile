FROM python:3.9-slim-buster

ENV PYTHONUNBUFFERED=1

WORKDIR /Real_Estate

COPY requirements.txt requirements.txt
COPY . .

#RUN pip3 install psycopg2-binary
RUN pip3 install --index-url=https://pypi.python.org/simple/ psycopg2-binary
RUN pip install -r requirements.txt

EXPOSE 8000/tcp

# Set environment variables for superuser creation
ENV DJANGO_SUPERUSER_USERNAME=Admin
ENV DJANGO_SUPERUSER_EMAIL=adminteam@gmail.com
ENV DJANGO_SUPERUSER_PASSWORD=team123 

CMD ["sh", "-c", "python manage.py makemigrations && python manage.py migrate && python manage.py createsuperuser --noinput && python manage.py runserver 0.0.0.0:8000"]
