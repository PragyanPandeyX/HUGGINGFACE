FROM python:3.9

# Create a user with UID 1000 and home directory
RUN useradd -m -u 1000 user

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file and install Python dependencies as root
COPY ./requirements.txt requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy the rest of the application code
COPY . /app

# Create the node_modules directory and set proper permissions
RUN mkdir /app/node_modules && chown -R user:user /app

# Copy and make the setup.sh file executable as root
COPY ./setup.sh /app/setup.sh
RUN chmod +x /app/setup.sh

# Run the setup.sh script to install Node.js (as root)
RUN /app/setup.sh

# Switch to non-root user after setting up Node.js and sessions directory
USER user

# Set environment variables if needed
#ENV HOME=/home/user \
#    PATH=/home/user/.local/bin:$PATH

# Run the application
CMD ["python3", "main.py"]
