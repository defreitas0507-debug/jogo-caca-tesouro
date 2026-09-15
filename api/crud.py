from .database import get_connection
def listar_partidas():
    conn=get_connection(); rows=conn.execute("SELECT * FROM partidas ORDER BY id").fetchall(); conn.close(); return [dict(r) for r in rows]
def obter_partida(partida_id:int):
    conn=get_connection(); row=conn.execute("SELECT * FROM partidas WHERE id=?",(partida_id,)).fetchone(); conn.close(); return dict(row) if row else None
def listar_casas(partida_id:int):
    conn=get_connection(); rows=conn.execute("SELECT numero,linha,coluna,nivel,conteudo FROM casas WHERE partida_id=? ORDER BY numero",(partida_id,)).fetchall(); conn.close(); return [dict(r) for r in rows]
