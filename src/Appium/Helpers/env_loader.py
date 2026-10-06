import os
from pathlib import Path
from dotenv import load_dotenv

load_dotenv(Path(__file__).resolve().parents[3] / '.env')


def get_env_variable(key):
    value = os.getenv(key)
    if value is None or not value.strip():
        raise ValueError(f"Required environment variable '{key}' is missing or empty.")
    return value
