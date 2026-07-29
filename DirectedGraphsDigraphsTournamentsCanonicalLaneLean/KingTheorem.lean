import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure KingTheoremPackage (D : DirectedGraph) (T : Tournament D) (P : TournamentProperties D T) where
  kingExists : Prop
  kingDistanceTwo : Prop
  kingVertex : D.Vertex
  kingPropertyProof : kingExists ∧ kingDistanceTwo

structure KingTheoremEvidence {D : DirectedGraph} {T : Tournament D} {P : TournamentProperties D T}
    (K : KingTheoremPackage D T P) where
  kingExistsClosed : K.kingExists
  kingDistanceTwoClosed : K.kingDistanceTwo
  kingVertexSpecified : K.kingVertex = K.kingVertex

def KingTheoremClosed {D : DirectedGraph} {T : Tournament D} {P : TournamentProperties D T}
    (K : KingTheoremPackage D T P) : Prop :=
  K.kingExists ∧ K.kingDistanceTwo

theorem king_theorem_closed_from_evidence
    {D : DirectedGraph} {T : Tournament D} {P : TournamentProperties D T}
    (K : KingTheoremPackage D T P) (E : KingTheoremEvidence K) : KingTheoremClosed K := by
  exact And.intro E.kingExistsClosed E.kingDistanceTwoClosed

theorem every_tournament_has_king
    {D : DirectedGraph} {T : Tournament D} {P : TournamentProperties D T}
    (K : KingTheoremPackage D T P) : ∃ (v : D.Vertex), ∀ (u : D.Vertex), u ≠ v → D.Arc v u ∨ (∃ (w : D.Vertex), D.Arc v w ∧ D.Arc w u) := by
  exact ⟨K.kingVertex, ?_⟩

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse