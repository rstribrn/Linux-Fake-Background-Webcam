FROM python:3.8

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
      python3-numpy \
      python3-opencv \
      python3-requests
RUN apt-get install -y ffmpeg libsm6 libxext6
RUN rm -rf /var/cache/apt/* /var/lib/apt/lists/*

WORKDIR /src

COPY background.jpg \
    fake.py \
    requirements.txt \
    /src/

RUN pip3 install --no-cache-dir -r requirements.txt

ENTRYPOINT ["python3", "-u", "fake.py"]
CMD []
