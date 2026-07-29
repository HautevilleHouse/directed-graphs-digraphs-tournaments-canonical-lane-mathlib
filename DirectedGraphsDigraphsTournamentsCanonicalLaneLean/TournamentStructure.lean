import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure Tournament where
  Vertex : Type u
  Arc : Vertex → Vertex → Prop
  total : ∀ u v : Vertex, u ≠ v → (Arc u v) ∨ (Arc v u)
  antisymmetric : ∀ u v : Vertex, Arc u v → ¬ Arc v u

structure TournamentPackage where
  tournament : Tournament
  scoreSequence : List ℕ
  scoreSequenceClosed : Prop
  transitiveSubtournamentExistence : Prop
  hamiltonianPathExistence : Prop

structure TournamentEvidence (T : TournamentPackage) where
  scoreSequenceClosedClosed : T.scoreSequenceClosed
  transitiveSubtournamentExistenceClosed : T.transitiveSubtournamentExistence
  hamiltonianPathExistenceClosed : T.hamiltonianPathExistence

def TournamentClosed (T : TournamentPackage) : Prop :=
  T.scoreSequenceClosed ∧ T.transitiveSubtournamentExistence ∧ T.hamiltonianPathExistence

theorem tournament_closed_from_evidence (T : TournamentPackage) (E : TournamentEvidence T) :
    TournamentClosed T := by
  exact And.intro E.scoreSequenceClosedClosed (And.intro E.transitiveSubtournamentExistenceClosed E.hamiltonianPathExistenceClosed)

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse