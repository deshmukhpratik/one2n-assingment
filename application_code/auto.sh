cd /home/ubuntu/one2n-assingment/application_code
docker build -t app .
docker run -it -d -p 5000:5000 --name python app
