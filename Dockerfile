FROM ubuntu

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y python3
RUN apt install -y python3-pip
RUN pip3 install --upgrade pip


WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN python manage.py migrate 

EXPOSE 80

ENTRYPOINT ["python", "manage.py"]

CMD ["runserver", "0.0.0.0:8000"]