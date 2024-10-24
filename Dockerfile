# Step 1: Use a base image with Python installed
FROM --platform=linux/amd64 python:3.8

# Step 2: Set the working directory in the container
WORKDIR /app

# RUN adduser appuser
# RUN su appuser

# Install Apt packages
RUN apt-get update && apt-get install -y wget zip curl

# Pinning to a specific version of ChromeDriver and Chrome
ARG CHROME_VERSION="126.0.6478.61"

# # Install Ollama
# RUN curl -fsSL https://ollama.com/install.sh | sh

# # Start Ollama
# RUN ollama start & \
#     sleep 5 && \
#     ollama run llama3.2:1b

# Install Chrome WebDriver
RUN mkdir -p /opt/chromedriver-$CHROME_VERSION  
RUN curl -sS -o /tmp/chromedriver_linux64.zip https://storage.googleapis.com/chrome-for-testing-public/${CHROME_VERSION}/linux64/chromedriver-linux64.zip
RUN unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-$CHROME_VERSION
RUN rm /tmp/chromedriver_linux64.zip
RUN chmod +x /opt/chromedriver-$CHROME_VERSION/chromedriver-linux64
RUN ls /app
RUN ln -fs /opt/chromedriver-$CHROME_VERSION/chromedriver-linux64 /app/chromedriver
RUN ls /app

# Install Google Chrome
RUN curl --output google-chrome.deb https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}-1_amd64.deb
RUN apt-get install -y --no-install-recommends ./google-chrome.deb



# Step 3: Copy the requirements.txt file into the container
COPY requirements.txt .

# Step 4: Install the dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the rest of your application code into the container
COPY . .
RUN ls /app

# Step 6: Define the command to run your application (if applicable)
CMD ["streamlit","run", "main.py"]
