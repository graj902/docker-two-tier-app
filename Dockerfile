# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container to /app
WORKDIR /app

# Copy the requirements file into the container at /app
COPY app/requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's source code from the 'app' directory
COPY app/ .

# Expose port 5000 to allow traffic to the Flask application
EXPOSE 5000

# Define the command to run your app using gunicorn (a production-ready server)
# We will install gunicorn in the next step. For now, we set up the Python server.
CMD ["python", "app.py"]
