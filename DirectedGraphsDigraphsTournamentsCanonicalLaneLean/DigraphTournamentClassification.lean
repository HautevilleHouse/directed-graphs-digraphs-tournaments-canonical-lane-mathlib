import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure TournamentClassification where
  digraph : AdjacencyMatrixObject
  total : ∀ u v, u ≠ v → (adjacency u v) ∨ (adjacency v u)
  regular : Option (Nat → Nat)
  transitive : Option (Nat → Nat)
  bridgeClosed : bridgeClosed (AdmissibleClass.mk ...)
  gateClosed : gateClosed (AdmissibleClass.mk ...)

def TournamentClassificationClosed (T : TournamentClassification) : Prop :=
  T.total ∧ T.bridgeClosed ∧ T.gateClosed

end HautevilleHouse
end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
