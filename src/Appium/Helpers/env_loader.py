import os
from dotenv import load_dotenv


    

def get_env_variable(key):
    """Retorna o valor da variável de ambiente correspondente à chave fornecida."""
    load_dotenv(".env")
    value = os.getenv(key)
    if value is None:
        raise ValueError(f"Environment variable '{key}' does not exist.")
    return value
