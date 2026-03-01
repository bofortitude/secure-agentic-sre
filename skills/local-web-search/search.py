import requests
import json

def searxng_query(query, instance_url="http://localhost:8888", categories=None, engines=None):
    """
    Queries a local SearXNG instance and returns a list of results.
    """
    params = {
        "q": query,
        "format": "json",
    }
    
    if categories:
        params["categories"] = categories  # e.g., "it,science"
    if engines:
        params["engines"] = engines        # e.g., "google,bing"

    try:
        response = requests.get(f"{instance_url}/search", params=params, timeout=10)
        response.raise_for_status()
        
        data = response.json()
        return data.get("results", [])
        
    except requests.exceptions.RequestException as e:
        print(f"Error connecting to SearXNG: {e}")
        return []

# --- Example Usage ---
if __name__ == "__main__":
    search_term = "python fastAPI tutorial"
    results = searxng_query(search_term, categories="it")

    print(f"Found {len(results)} results for: {search_term}\n")
    
    for idx, result in enumerate(results[:5], 1):
        title = result.get("title")
        url = result.get("url")
        score = result.get("score", 0)
        print(f"{idx}. {title}")
        print(f"   URL: {url}")
        print(f"   Relevance Score: {score}\n")
