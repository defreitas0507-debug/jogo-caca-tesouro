from pydantic import BaseModel
class CasaOut(BaseModel):
    numero: int
    linha: int
    coluna: int
    nivel: int
    conteudo: str
