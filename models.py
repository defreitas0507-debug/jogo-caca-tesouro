from pydantic import BaseModel, Field
class PartidaCreate(BaseModel):
    percentual_nivel1: int = Field(ge=0, le=100)
    percentual_nivel2: int = Field(ge=0, le=100)
    percentual_nivel3: int = Field(ge=0, le=100)
    bateria_inicial: int = 100
class PartidaOut(BaseModel):
    id: int
    percentual_nivel1: int
    percentual_nivel2: int
    percentual_nivel3: int
    bateria_inicial: int
    bateria_final: int
    creditos_obtidos: int
    nivel_atingido: int
    tesouro_encontrado: int
    rodadas: int
    linha_risco: int
    coluna_risco: int
