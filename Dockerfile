# Dockerfile for book_catalog microservice
# Sets the base image for our new image, which allows us to produce new images based on existing images
FROM python:3.11-alpine  

# Sets the directory as app in our image. Other paths are relative to this.
WORKDIR /app/

# Copies package.json (requirements.txt in python) into the image
COPY book_catalog/requirements.txt . 

# Installs the package modules
RUN pip install --no-cache-dir -r requirements.txt

# Copies the source code for this microservice
COPY /book_catalog/ .     

# Copies our sample video
#COPY ./videos ./videos 

# Starts the microservice 
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]    
