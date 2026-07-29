import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure DirectedGraph where
  Vertex : Type u
  Arc : Type v
  source : Arc → Vertex
  target : Arc → Vertex
  loopFree : ∀ (a : Arc), source a ≠ target a

structure Digraph extends DirectedGraph where
  noMultipleArcs : ∀ (a b : Arc), source a = source b → target a = target b → a = b

structure Tournament extends Digraph where
  totalPairs : ∀ (u v : Vertex), u ≠ v → ∃ (a : Arc), source a = u ∧ target a = v

structure TournamentAdmittedObject where
  tournament : Tournament
  vertexCount : ℕ
  finite : Fintype tournament.Vertex
  conclusion : tournament.totalPairs

def TournamentWitnessClosed (O : TournamentAdmittedObject) : Prop :=
  O.conclusion

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse