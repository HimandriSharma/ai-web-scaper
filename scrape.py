import selenium.webdriver as webdriver
from selenium.webdriver.chrome.service import Service
from bs4 import BeautifulSoup
from webdriver_manager.chrome import ChromeDriverManager



def scrape_website(website):
    print ("Launching chrome drivers...")
    
    chrome_driver_path = "/app/chromedriver/chromedriver"
    # chrome_driver_path = "./chromedriver"
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--headless=new")
    chrome_options.add_argument("--disable-dev-shm-usage")
    driver = webdriver.Chrome(service=Service(chrome_driver_path), options=chrome_options)
    # Service(ChromeDriverManager("126.0.6478.61").install())

    try: 
        driver.get(website)
        print("Page Loaded")

        html = driver.page_source

        return html
    finally:
        driver.quit()

def extract_body_content(html_content):
    soup = BeautifulSoup(html_content,"html.parser")
    body_content = soup.body
    if body_content:
        return str(body_content)
    return ""


def clean_body_content(body_content):
    soup = BeautifulSoup(body_content, "html.parser")

    for script_or_style in soup(["script","style"]):
        script_or_style.extract()

    cleaned_content = soup.get_text(separator="\n")
    cleaned_content = "\n".join(line.strip() for line in cleaned_content.splitlines() if line.strip())

    return cleaned_content

def splif_dom_content(dom_content, max_length = 6000):
    return [
        dom_content[i : i+max_length] for i in range(0, len(dom_content), max_length)
    ]