from fastapi import FastAPI, HTTPException
from .crud import listar_partidas, obter_partida, listar_casas
app=FastAPI(title="API - Jogo Caca ao Tesouro",version="1.0.0",description="API de consulta dos dados do jogo Caca ao Tesouro.")
@app.get("/",tags=["Geral"])
def inicio(): return {"mensagem":"API do Jogo Caca ao Tesouro funcionando!"}
@app.get("/partidas",tags=["Partidas"])
def get_partidas(): return listar_partidas()
@app.get("/partidas/{partida_id}",tags=["Partidas"])
def get_partida(partida_id:int):
    p=obter_partida(partida_id)
    if not p: raise HTTPException(status_code=404,detail="Partida nao encontrada")
    return p
@app.get("/partidas/{partida_id}/casas",tags=["Casas"])
def get_casas(partida_id:int):
    if not obter_partida(partida_id): raise HTTPException(status_code=404,detail="Partida nao encontrada")
    return listar_casas(partida_id)
