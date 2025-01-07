# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 (or another specified port) available to the world outside this container
EXPOSE 5000

# Define the command to run the app using gunicorn
CMD ["gunicorn", "--workers=4", "--bind=0.0.0.0:5000", "app:app"]
