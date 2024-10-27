# AI Web Scraper

This project is an AI-powered web scraper that scrapes data from a provided URL and arranges it based on a user-defined prompt. It utilizes natural language processing (NLP) to tailor the scraped content to user specifications.

## Features

- Scrapes web content based on a URL.
- Utilizes AI to process and arrange data according to a given prompt.
- Clean and modular architecture using Docker services.
- Supports dynamic user interaction through NLP and web scraping tools.



## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/HimandriSharma/ai-web-scraper.git
   cd ai-web-scraper
   ```
2. Ensure Docker is installed on your system. If not, download and install it from [here](https://docs.docker.com/).

## Running the Project

The project uses Docker Compose to run two services: the Ollama AI service and the main web scraper service.

1. Start the Ollama service:
   ```
   docker compose up ollama --build
   ```

2. Once the Ollama service is running successfully, start the web service:
   ```
   docker compose up web --build
   ```

Alternatively, you can run both services together with:
   ```
   docker compose up --build
   ```

## Usage
1. Navigate to http://localhost:8501 in your browser after the services are up and running.
2. Enter the URL you want to scrape.
3. Provide a prompt specifying how you want the scraped data to be arranged.
4. The AI will process and display the data according to your input.

## Contributing
Feel free to fork this repository, make improvements, and submit pull requests. Contributions are always welcome!

## Demo
[Video Demo](https://www.loom.com/share/ece8f3ba4e9046e29eb06da333553459?sid=00060eb1-3843-429f-ac50-bd38600b7004)
