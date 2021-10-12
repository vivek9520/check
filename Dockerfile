FROM python:3.8


ENV PYTHONUNBUFFERED True

ENV APP_HOME /app

WORKDIR $APP_HOME

COPY . ./

RUN pip install -r requirements.txt

RUN pip install gunicorn

# ENTRYPOINT [ "python" ]

# CMD [ "app.py" ]
# RUN pip install numpy
# RUN pip install flask
# RUN pip install flask_core
# RUN pip install Pillow
# RUN pip install scipy
# RUN pip install matplotlib
# RUN pip install DateTime

# COPY app.py .
# COPY feature.pkl .
# COPY images.pkl .
# COPY pca_features.pkl .

# EXPOSE 500

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app

